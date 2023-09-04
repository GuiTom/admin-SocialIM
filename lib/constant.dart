import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Constant {
  Constant._();

  static String get serverUrl {
    if (isDebug) {
      return debugServertUrl;
    } else {
      return releaseServerUrl;
    }
  }

  static String get socketUrl {
    if (isDebug) {
      return debugSocketUrl;
    } else {
      return releaseSocketUrl;
    }
  }

  static Future initDiertory() async {
    documentsDirectory = await getApplicationDocumentsDirectory();
  }

  static const String debugSocketUrl = 'ws://192.168.1.12:8086/ws';

  static const String releaseSocketUrl = 'ws://qtxjc.com:8086/ws';

  static const String debugServertUrl = 'http://192.168.1.12:8080';

  static const String releaseServerUrl = 'http://qtxjc.com:8080';
  static const String agroaAppId = "0a3d1efd4a7d4ed4a057a0ee869cfcfb";

  static bool get isDebug {

    if (const bool.fromEnvironment('dart.vm.product') &&
        !const bool.fromEnvironment('debug_mode')) {
      // 发布（release）环境
      return false;
    } else {
      // 调试（debug）环境
      return true;
    }
  }

  static Directory? documentsDirectory;
}
