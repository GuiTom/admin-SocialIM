
import 'package:fixnum/fixnum.dart';

import '../locale/k.dart';
import '../protobuf/generated/user.pb.dart';
import '../util/events.dart';
import '../util/prefs_helper.dart';
import 'package:intl/intl.dart';

import '../util/type_util.dart';

class Session {
  Session._();
  static User? _userInfo;

  static User get userInfo {
    String userStr = PrefsHelper.getString('userInfo');
    _userInfo ??= userStr.isNotEmpty ? User.fromJson(userStr) : User();
    return _userInfo!;
  }

  static void _sync() {
    PrefsHelper.setString('userInfo', userInfo.writeToJson());
  }

  static set userInfo(User? user) {
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

  static List<int> get friendList {
    return TypeUtil.parseIntList(userInfo.friendUidListStr);
  }

  static List<int> get fansList {
    return TypeUtil.parseIntList(userInfo.fansUidListStr);
  }

  static List<int> get focusList {
    return TypeUtil.parseIntList(userInfo.focusUidListStr);
  }

  static List<int> get blackUidList {
    return TypeUtil.parseIntList(userInfo.blackUidListStr);
  }
  //用户黑名单
  static Map<int, bool> get blackUidMap {
    Map<int, bool> m = {};
    TypeUtil.parseIntList(userInfo.blackUidListStr).forEach((element) {
      m[element] = true;
    });
    return m;
  }
  //UGC动态黑名单
  static List<int> get blackDynList {
    return TypeUtil.parseIntList(userInfo.blackDynIdListStr);
  }

  //UGC动态黑名单
  static Map<int, bool> get blackDynMap {
    Map<int, bool> m = {};
    TypeUtil.parseIntList(userInfo.blackDynIdListStr).forEach((element) {
      m[element] = true;
    });
    return m;
  }

  static addFriend(int otherUid) {
    List<int> l = friendList;
    l.add(otherUid);
    userInfo.friendUidListStr = TypeUtil.parseString(l);
  }

  static removeFriend(int otherUid) {
    List<int> l = friendList;
    l.remove(otherUid);
    userInfo.friendUidListStr = TypeUtil.parseString(l);
  }

  static addFans(int otherUid) {
    List<int> l = fansList;
    l.add(otherUid);
    userInfo.fansUidListStr = TypeUtil.parseString(l);
  }

  static removeFans(int otherUid) {
    List<int> l = fansList;
    l.remove(otherUid);
    userInfo.fansUidListStr = TypeUtil.parseString(l);
  }

  static addFocus(int otherUid) {
    List<int> l = focusList;
    l.add(otherUid);
    userInfo.focusUidListStr = TypeUtil.parseString(l);
  }

  static removeFocus(int otherUid) {
    List<int> l = focusList;
    l.remove(otherUid);
    userInfo.focusUidListStr = TypeUtil.parseString(l);
  }

  static addUserBlackList(int otherUid) {
    List<int> l = blackUidList;
    l.add(otherUid);
    userInfo.blackUidListStr = TypeUtil.parseString(l);
  }

  static removeUserBlackList(int otherUid) {
    List<int> l = blackUidList;
    l.remove(otherUid);
    userInfo.blackUidListStr = TypeUtil.parseString(l);
  }

  static addDynBlackList(int dynId) {
    List<int> l = blackDynList;
    l.add(dynId);
    userInfo.blackDynIdListStr = TypeUtil.parseString(l);
  }

  static removeDynBlackList(int otherUid) {
    List<int> l = blackUidList;
    l.remove(otherUid);
    userInfo.blackDynIdListStr = TypeUtil.parseString(l);
  }

  static bool allowPasswordEmpty = false; //暂时允许不设置密码
  static set passwordSetted(bool setted) {
    userInfo.passwordSetted = setted;
    _sync();
  }

  static String getValue(String key) {
    return PrefsHelper.getValue(key, '');
  }

  static void logOut() {
    eventCenter.emit('logOut');
    PrefsHelper.delete('userInfo');
    PrefsHelper.delete('countryIsoCode');
    PrefsHelper.delete('needShowProfilePreset');

    allowPasswordEmpty = false;
    userInfo = null;

    eventCenter.emit('userInfoChanged');
  }

  static String get birthday {
    String formattedDate =
        DateFormat(K.getTranslation('date_str', args: ['yyyy', 'M', 'd']))
            .format(birthdayDate);
    return formattedDate;
  }

  static DateTime get birthdayDate {
    final birthDate =
        DateTime.fromMillisecondsSinceEpoch(userInfo.bornAt.toInt() * 1000);
    return birthDate;
  }

  static set name(String name) {
    userInfo.name = name;
    PrefsHelper.setString('userInfo', userInfo.writeToJson());
  }

  static set phone(String name) {
    userInfo.phone = name;
    PrefsHelper.setString('userInfo', userInfo.writeToJson());
  }
  static set email(String name) {
    userInfo.email = name;
    PrefsHelper.setString('userInfo', userInfo.writeToJson());
  }
  static set countryIsoCode(String code) {
    PrefsHelper.setString('countryIsoCode', code);
  }

  static set needShowProfilePreset(bool value) {
    PrefsHelper.setBool('needShowProfilePreset', value);
  }

  static bool get needShowProfilePreset {
    return PrefsHelper.getBool('needShowProfilePreset', true);
  }

  static String get countryIsoCode {
    return PrefsHelper.getString('countryIsoCode');
  }

  static set signature(String name) {
    userInfo.signature = name;
    _sync();
  }

  static set bornAt(Int64 bornAt) {
    userInfo.bornAt = bornAt;
    _sync();
  }

  static set sex(int sex) {
    userInfo.sex = sex;
    _sync();
  }

  static set countryCode(String countryCode) {
    userInfo.countryCode = countryCode;
    _sync();
  }

  static set countryName(String countryName) {
    userInfo.countryName = countryName;
    _sync();
  }

  static set provinceCode(String provinceCode) {
    userInfo.provinceCode = provinceCode;
    _sync();
  }

  static set provinceName(String provinceName) {
    userInfo.provinceName = provinceName;
    _sync();
  }

  static set cityCode(String cityCode) {
    userInfo.cityCode = cityCode;
    _sync();
  }

  static set cityName(String cityName) {
    userInfo.cityName = cityName;
    _sync();
  }

  static set level(int level) {
    userInfo.level = level;
    _sync();
  }

  static set wealth(int wealth) {
    userInfo.wealth = wealth;
    _sync();
  }
}
