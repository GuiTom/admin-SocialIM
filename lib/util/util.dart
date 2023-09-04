import 'dart:convert';
// import 'package:crypto/crypto.dart';
// import 'package:intl/intl.dart';
// import '../../base.dart';
import 'dart:ui';

import 'package:crypto/crypto.dart';


class Util {
  static double get width {
    return window.physicalSize.width / window.devicePixelRatio;
  }
  static double get height {
    return window.physicalSize.height / window.devicePixelRatio;
  }
  /// +86 12开头的号段为运营号专用
  static bool isMobile(String phone, {String areaCode = '86'}) {
    if (areaCode == '86') {
      return phone.isNotEmpty &&
          RegExp("^(12|13|14|15|16|17|18|19)\\d{9}\$").hasMatch(phone);
    } else {
      return phone.isNotEmpty && phone.length >= 6 && phone.length <= 12;
    }
  }

  static bool isEmail(String email) {
    return email.isNotEmpty && RegExp(
        "^[-a-zA-Z0-9_\.]+\@([0-9A-Za-z_][0-9A-Za-z-]+\.)+[A-Za-z]{2,8}\$")
        .hasMatch(email);
  }

  static bool isVerifyCode(String code) {
    return code.length == 4 && RegExp(r'^[0-9]+$').hasMatch(code);
  }

  static bool isVerifyPwd(String pwd) {
    if (pwd == null || pwd.isEmpty) return false;
    if (pwd.length < 6) return false;
    return true;
  }
  static String cryptPwd(String pwd){
    return sha1.convert(utf8.encode(pwd)).toString();
  }
  //
  // static String getHeadIconUrl(int uid) {
  //   return System.file('/file/userHead/$uid.jpg');
  // }
  // static String getGameIconUrl(int uid) {
  //   return System.file('/gameIcon/$uid.jpg');
  // }
  // static String fromatedDateTime(int seconds) {
  //   String formattedDate =
  //   DateFormat(K.getTranslation('date_str',args:['yyyy', 'M', 'd']))
  //       .format(DateTime.fromMillisecondsSinceEpoch(seconds* 1000));
  //   return formattedDate;
  // }
  static int calculateAge(int birthTimestamp) {
    final currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    final birthDate = DateTime.fromMillisecondsSinceEpoch(birthTimestamp*1000);
    final currentDate = DateTime.fromMillisecondsSinceEpoch(currentTimestamp);

    // 计算年龄差值
    final ageDiff = currentDate.year - birthDate.year;

    // 如果当前日期的月份小于出生日期的月份，或者月份相等但当前日期的日小于出生日期的日，
    // 则年龄减 1，因为还未过完生日
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      return ageDiff - 1;
    }

    return ageDiff;
  }
}
