import 'dart:io';
import 'dart:typed_data';

import 'stroage.dart';
import 'dart:html';
///Save cookies in  files

class LocalStorage implements Storage {
  LocalStorage([this.dir]);

  /// [_dir]: where the cookie files saved in, it must be a directory path.
  final String? dir;

  String? _curDir;

  String? Function(Uint8List list)? readPreHandler;

  List<int> Function(String value)? writePreHandler;

  @override
  Future<void> delete(String key) async {
    // final file = File('$_curDir$key');
    // if (file.existsSync()) {
    //   await file.delete(recursive: true);
    // }
    String _key = '$_curDir$key';
    window.localStorage.remove(_key);
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    // await Directory(_curDir!).delete(recursive: true);
    keys.forEach((key) {
      String _key = '$_curDir$key';
      window.localStorage.remove(_key);
    });
  }

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) async {
    _curDir = dir ?? './.cookies/';
    if (!_curDir!.endsWith('/')) {
      _curDir = _curDir! + '/';
    }
    _curDir = _curDir! + 'ie${ignoreExpires ? 1 : 0}_ps${persistSession ? 1 : 0}/';
    await _makeCookieDir();
  }

  @override
  Future<String?> read(String key) async {

    if (window.localStorage['$_curDir$key']!=null) {
      if (readPreHandler != null) {
        return readPreHandler!(window.localStorage['$_curDir$key'] as Uint8List);
      } else {
        return window.localStorage['$_curDir$key'];
      }
    }
    return null;
  }

  @override
  Future<void> write(String key, String value) async {
    await _makeCookieDir();

    if (writePreHandler != null) {
      // await file.writeAsBytes(writePreHandler!(value));
      window.localStorage['$_curDir$key'] = writePreHandler!(value) as String;
    } else {
      window.localStorage['$_curDir$key'] = value;
    }
  }

  Future<void> _makeCookieDir() async {
    // final directory = Directory(_curDir!);
    // if (!directory.existsSync()) {
    //   await directory.create(recursive: true);
    // }
  }
}
