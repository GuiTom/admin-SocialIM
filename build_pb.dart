import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

/// 传完整路径会指定生成某个PB
/// 在当前目录下执行 dart build_pb.dart
/// 支持所有模块、任意位置的proto
/// 生成 charles_mapping.xml 及 proto.desc 用于抓包
/// 接口->pb结构体 的映射请配置在mapping.json文件中
main(List<String>? args) async {
  if (args?.isNotEmpty ?? false) {
    ///有路径，只编译当前路径的pb
    String path = args![0];
    Directory pwd = Directory.current;
    if (!path.startsWith(pwd.path)) {
      path = p.join(pwd.path, path);
    }
    print('path -> $path');
    File proto = File(path);
    if (!proto.existsSync()) {
      print('文件不存在');
      return;
    }
    String generatedPath = p.join(proto.parent.path, 'generated');
    Directory generatedDir = Directory(generatedPath);
    if (!generatedDir.existsSync()) {
      generatedDir.createSync(recursive: true);
    }
    await _genPbDart(proto);
    generatedDir.list().forEach((e) {
      if (e.path.endsWith('.pbserver.dart')) {
        e.delete();
      }
    });
  } else {
    Directory pwd = Directory.current;

    List<Directory> modules = [pwd];

    Directory baseDir = Directory(p.join(pwd.path, 'banban_base'));

    Iterable<Directory> subModules = baseDir.listSync().where((e) => e is Directory).cast();
    subModules.forEach((dir) {
      if (_isValidModule(dir)) {
        modules.add(dir);
      }
    });

    List<File> allProtos = [];
    Set<String> protoParentDirs = {};
    List<File> allMappings = [];

    for (Directory dir in modules) {
      print('Processing module: ${dir.path}');
      // 查找当前模块lib下的所有proto文件
      Iterable<File> protos = Directory(p.join(dir.path, 'lib'))
          .listSync(recursive: true)
          .where((e) => e is File && e.path.endsWith('.proto'))
          .cast();
      if (protos.isEmpty) {
        continue;
      } else {
        allProtos.addAll(protos);
        Set<String> generatedDirs = {};
        // 重建 generated 目录
        for (File proto in protos) {
          String path = p.join(proto.parent.path, 'generated');
          protoParentDirs.add(proto.parent.path);
          generatedDirs.add(path);
        }
        generatedDirs.forEach((s) {
          Directory d = Directory(s);
          if (d.existsSync()) {
            d.deleteSync(recursive: true);
          }
          d.createSync(recursive: true);
        });

        List<Future> futures = [];
        // 生成.dart
        for (File proto in protos) {
          futures.add(_genPbDart(proto));
        }
        await Future.wait(futures);

        // 删除暂时无用的文件
        generatedDirs.forEach((s) {
          Directory(s).list().forEach((e) {
            if (/*e.path.endsWith('.pbjson.dart') ||*/
                e.path.endsWith('.pbserver.dart')) {
              e.delete();
            }
          });
        });
      }

      // 查找所有mapping.json
      Iterable<File> mappings = dir
          .listSync(recursive: true)
          .where((e) => e is File && e.path.endsWith('mapping.json'))
          .cast();
      if (mappings.isNotEmpty) {
        allMappings.addAll(mappings);
      }
    }

    // 生成protobuf的描述文件(可用于charles抓包时解析body)
    File desc = File(p.join(pwd.path, 'proto.desc'));
    desc.createSync(recursive: true);
    ProcessResult genDescResult = Process.runSync(
      'protoc',
      [
        '--descriptor_set_out=${desc.path}',
      ]
        ..addAll(protoParentDirs.map((e) => '-I$e'))
        ..addAll(allProtos.map((e) => e.path).toList()),
    );
    if (genDescResult.exitCode != 0) {
      print('${genDescResult.stderr}');
    }

    // charles映射(接口-pb)配置文件
    File mappingXml = File(p.join(pwd.path, 'charles_mapping.xml'));
    _handleMappings(allMappings, mappingXml);
  }
}

bool _isValidModule(Directory dir) {
  File yaml = File(p.join(dir.path, 'pubspec.yaml'));
  if (!yaml.existsSync()) {
    // is not a flutter module
    return false;
  }
  Directory lib = Directory(p.join(dir.path, 'lib'));
  if (!lib.existsSync()) {
    return false;
  }
  return true;
}

Future<void> _genPbDart(File proto) async {
  return Process.run('protoc', [
    '--proto_path=${proto.parent.path}',
    '--dart_out=${p.join(proto.parent.path, 'generated')}',
    proto.path,
  ]).whenComplete(() {
    print('Process proto: ${proto.path}');
  }).then((processResult) {
    if (processResult.exitCode == 0) {
      // 生成的dart文件
      File pb = File(p.setExtension(
          p.join(p.join(proto.parent.path, 'generated'),
              p.basenameWithoutExtension(proto.path)),
          '.pb.dart'));
      print('Success: ${pb.path}');
    } else {
      print('Failure: ${processResult.stderr}');
    }
  });
}

void _handleMappings(Iterable<File> allMappings, File dst) {
  if (allMappings == null || allMappings.isEmpty) return;

  Map<String, String> map = {};
  for (File mapping in allMappings) {
    try {
      String source = mapping.readAsStringSync();
      Map<String, String> json = Map<String, String>.from(jsonDecode(source));
      map.addAll(json);
    } catch (e) {
      print(e);
      exit(1);
    }
  }
  if (map.isNotEmpty) {
    _genXml(map, dst);
  }
}

void _genXml(Map<String, String> json, File dst) {
  List<String> lines = [];
  lines.add(
      "<?xml version=\"1.0\" encoding=\"utf-8\"?><?charles serialisation-version='2.0' ?>");
  lines.add("<viewerMappings>");
  lines.add("    <toolEnabled>true</toolEnabled>");
  lines.add("    <mappings>");
  json.forEach((key, value) {
    lines.add("        <viewerMapping>");
    lines.add("            <enabled>true</enabled>");
    lines.add("            <location>");
    lines.add("                <path>$key</path>");
    lines.add("            </location>");
    lines.add("            <responseType>");
    lines.add("                <type>PROTOBUF</type>");
    lines.add(
        "                <protobufMessageType>$value</protobufMessageType>");
    lines.add("                <json>false</json>");
    lines.add("                <protobufDelimited>false</protobufDelimited>");
    lines.add("            </responseType>");
    lines.add("        </viewerMapping>");
  });
  lines.add("    </mappings>");
  lines.add("</viewerMappings>");

  dst.writeAsString(lines.join('\n'));
}
