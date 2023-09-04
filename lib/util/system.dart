import '../constant.dart';

class System {
  static String api(String path){
    return '${Constant.serverUrl}$path';
  }
  static String file(String path){
    return '${Constant.serverUrl}$path';
  }
}