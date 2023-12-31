
import 'package:fixnum/fixnum.dart';

import '../locale/k.dart';
import '../protobuf/generated/adminUser.pb.dart';
import '../util/events.dart';
import '../util/prefs_helper.dart';
import 'package:intl/intl.dart';

import '../util/type_util.dart';

class Session {
  Session._();
  static AdminUser? _userInfo;

  static AdminUser get userInfo {
    String userStr = PrefsHelper.getString('userInfo');
    _userInfo ??= userStr.isNotEmpty ? AdminUser.fromJson(userStr) : AdminUser();
    return _userInfo!;
  }

  static void _sync() {
    PrefsHelper.setString('userInfo', userInfo.writeToJson());
  }

  static set userInfo(AdminUser? user) {
    _userInfo = user;
    if (user != null) {
      _sync();
    }
  }

  static int get uid {
    return userInfo.id.toInt();
  }

  static bool get passwordSetted {
    return userInfo.passwordSetted;
  }



  static bool allowPasswordEmpty = false; //暂时允许不设置密码
  static set passwordSetted(bool setted) {
    userInfo.passwordSetted = setted;
    _sync();
  }

  static String getValue(String key) {
    return PrefsHelper.getValue(key, '');
  }
  static set sessionId(String value){
    PrefsHelper.setString('sessionId', value);
  }
  static String get sessionId{
    return PrefsHelper.getString('sessionId', '');
  }
  static void logOut() {
    eventCenter.emit('logOut');
    PrefsHelper.delete('userInfo');
    PrefsHelper.delete('countryIsoCode');
    PrefsHelper.delete('needShowProfilePreset');
    PrefsHelper.delete('sessionId');

    allowPasswordEmpty = false;
    userInfo = null;

    eventCenter.emit('userInfoChanged');
  }

  static set name(String name) {
    userInfo.name = name;
    PrefsHelper.setString('userInfo', userInfo.writeToJson());
  }

  static set email(String name) {
    userInfo.email = name;
    PrefsHelper.setString('userInfo', userInfo.writeToJson());
  }



}
