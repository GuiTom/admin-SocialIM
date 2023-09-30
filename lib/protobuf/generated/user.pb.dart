///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'User', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'user'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sex', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.O3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'headId', protoName: 'headId')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'level', $pb.PbFieldType.O3)
    ..aInt64(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createAt', protoName: 'createAt')
    ..aInt64(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bornAt', protoName: 'bornAt')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signature')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cityCode', protoName: 'cityCode')
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provinceCode', protoName: 'provinceCode')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'countryCode', protoName: 'countryCode')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cityName', protoName: 'cityName')
    ..aOS(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provinceName', protoName: 'provinceName')
    ..aOS(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'countryName', protoName: 'countryName')
    ..aOS(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'setting')
    ..aOB(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'passwordSetted', protoName: 'passwordSetted')
    ..aOB(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toUnRegister', protoName: 'toUnRegister')
    ..aOS(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friendUidListStr', protoName: 'friendUidListStr')
    ..aOS(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fansUidListStr', protoName: 'fansUidListStr')
    ..aOS(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'focusUidListStr', protoName: 'focusUidListStr')
    ..aOS(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blackUidListStr', protoName: 'blackUidListStr')
    ..aOS(26, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blackDynIdListStr', protoName: 'blackDynIdListStr')
    ..a<$core.int>(27, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'worksCount', $pb.PbFieldType.O3, protoName: 'worksCount')
    ..aInt64(28, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'monthlyVipExpireAt', protoName: 'monthlyVipExpireAt')
    ..aInt64(29, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'yearlyVipExpireAt', protoName: 'yearlyVipExpireAt')
    ..aOB(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasCrown', protoName: 'hasCrown')
    ..a<$core.int>(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'coin', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User({
    $fixnum.Int64? id,
    $core.String? name,
    $core.int? sex,
    $core.int? height,
    $core.String? email,
    $core.String? phone,
    $core.String? headId,
    $core.int? level,
    $fixnum.Int64? createAt,
    $fixnum.Int64? bornAt,
    $core.String? signature,
    $core.String? cityCode,
    $core.String? provinceCode,
    $core.String? countryCode,
    $core.String? cityName,
    $core.String? provinceName,
    $core.String? countryName,
    $core.String? setting,
    $core.bool? passwordSetted,
    $core.bool? toUnRegister,
    $core.String? friendUidListStr,
    $core.String? fansUidListStr,
    $core.String? focusUidListStr,
    $core.String? blackUidListStr,
    $core.String? blackDynIdListStr,
    $core.int? worksCount,
    $fixnum.Int64? monthlyVipExpireAt,
    $fixnum.Int64? yearlyVipExpireAt,
    $core.bool? hasCrown,
    $core.int? coin,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (height != null) {
      _result.height = height;
    }
    if (email != null) {
      _result.email = email;
    }
    if (phone != null) {
      _result.phone = phone;
    }
    if (headId != null) {
      _result.headId = headId;
    }
    if (level != null) {
      _result.level = level;
    }
    if (createAt != null) {
      _result.createAt = createAt;
    }
    if (bornAt != null) {
      _result.bornAt = bornAt;
    }
    if (signature != null) {
      _result.signature = signature;
    }
    if (cityCode != null) {
      _result.cityCode = cityCode;
    }
    if (provinceCode != null) {
      _result.provinceCode = provinceCode;
    }
    if (countryCode != null) {
      _result.countryCode = countryCode;
    }
    if (cityName != null) {
      _result.cityName = cityName;
    }
    if (provinceName != null) {
      _result.provinceName = provinceName;
    }
    if (countryName != null) {
      _result.countryName = countryName;
    }
    if (setting != null) {
      _result.setting = setting;
    }
    if (passwordSetted != null) {
      _result.passwordSetted = passwordSetted;
    }
    if (toUnRegister != null) {
      _result.toUnRegister = toUnRegister;
    }
    if (friendUidListStr != null) {
      _result.friendUidListStr = friendUidListStr;
    }
    if (fansUidListStr != null) {
      _result.fansUidListStr = fansUidListStr;
    }
    if (focusUidListStr != null) {
      _result.focusUidListStr = focusUidListStr;
    }
    if (blackUidListStr != null) {
      _result.blackUidListStr = blackUidListStr;
    }
    if (blackDynIdListStr != null) {
      _result.blackDynIdListStr = blackDynIdListStr;
    }
    if (worksCount != null) {
      _result.worksCount = worksCount;
    }
    if (monthlyVipExpireAt != null) {
      _result.monthlyVipExpireAt = monthlyVipExpireAt;
    }
    if (yearlyVipExpireAt != null) {
      _result.yearlyVipExpireAt = yearlyVipExpireAt;
    }
    if (hasCrown != null) {
      _result.hasCrown = hasCrown;
    }
    if (coin != null) {
      _result.coin = coin;
    }
    return _result;
  }
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get sex => $_getIZ(2);
  @$pb.TagNumber(3)
  set sex($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSex() => $_has(2);
  @$pb.TagNumber(3)
  void clearSex() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get email => $_getSZ(4);
  @$pb.TagNumber(5)
  set email($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmail() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get phone => $_getSZ(5);
  @$pb.TagNumber(6)
  set phone($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPhone() => $_has(5);
  @$pb.TagNumber(6)
  void clearPhone() => clearField(6);

  @$pb.TagNumber(8)
  $core.String get headId => $_getSZ(6);
  @$pb.TagNumber(8)
  set headId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasHeadId() => $_has(6);
  @$pb.TagNumber(8)
  void clearHeadId() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get level => $_getIZ(7);
  @$pb.TagNumber(9)
  set level($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasLevel() => $_has(7);
  @$pb.TagNumber(9)
  void clearLevel() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get createAt => $_getI64(8);
  @$pb.TagNumber(10)
  set createAt($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasCreateAt() => $_has(8);
  @$pb.TagNumber(10)
  void clearCreateAt() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get bornAt => $_getI64(9);
  @$pb.TagNumber(11)
  set bornAt($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasBornAt() => $_has(9);
  @$pb.TagNumber(11)
  void clearBornAt() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get signature => $_getSZ(10);
  @$pb.TagNumber(12)
  set signature($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasSignature() => $_has(10);
  @$pb.TagNumber(12)
  void clearSignature() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get cityCode => $_getSZ(11);
  @$pb.TagNumber(13)
  set cityCode($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(13)
  $core.bool hasCityCode() => $_has(11);
  @$pb.TagNumber(13)
  void clearCityCode() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get provinceCode => $_getSZ(12);
  @$pb.TagNumber(14)
  set provinceCode($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(14)
  $core.bool hasProvinceCode() => $_has(12);
  @$pb.TagNumber(14)
  void clearProvinceCode() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get countryCode => $_getSZ(13);
  @$pb.TagNumber(15)
  set countryCode($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(15)
  $core.bool hasCountryCode() => $_has(13);
  @$pb.TagNumber(15)
  void clearCountryCode() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get cityName => $_getSZ(14);
  @$pb.TagNumber(16)
  set cityName($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(16)
  $core.bool hasCityName() => $_has(14);
  @$pb.TagNumber(16)
  void clearCityName() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get provinceName => $_getSZ(15);
  @$pb.TagNumber(17)
  set provinceName($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(17)
  $core.bool hasProvinceName() => $_has(15);
  @$pb.TagNumber(17)
  void clearProvinceName() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get countryName => $_getSZ(16);
  @$pb.TagNumber(18)
  set countryName($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(18)
  $core.bool hasCountryName() => $_has(16);
  @$pb.TagNumber(18)
  void clearCountryName() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get setting => $_getSZ(17);
  @$pb.TagNumber(19)
  set setting($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(19)
  $core.bool hasSetting() => $_has(17);
  @$pb.TagNumber(19)
  void clearSetting() => clearField(19);

  @$pb.TagNumber(20)
  $core.bool get passwordSetted => $_getBF(18);
  @$pb.TagNumber(20)
  set passwordSetted($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(20)
  $core.bool hasPasswordSetted() => $_has(18);
  @$pb.TagNumber(20)
  void clearPasswordSetted() => clearField(20);

  @$pb.TagNumber(21)
  $core.bool get toUnRegister => $_getBF(19);
  @$pb.TagNumber(21)
  set toUnRegister($core.bool v) { $_setBool(19, v); }
  @$pb.TagNumber(21)
  $core.bool hasToUnRegister() => $_has(19);
  @$pb.TagNumber(21)
  void clearToUnRegister() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get friendUidListStr => $_getSZ(20);
  @$pb.TagNumber(22)
  set friendUidListStr($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(22)
  $core.bool hasFriendUidListStr() => $_has(20);
  @$pb.TagNumber(22)
  void clearFriendUidListStr() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get fansUidListStr => $_getSZ(21);
  @$pb.TagNumber(23)
  set fansUidListStr($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(23)
  $core.bool hasFansUidListStr() => $_has(21);
  @$pb.TagNumber(23)
  void clearFansUidListStr() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get focusUidListStr => $_getSZ(22);
  @$pb.TagNumber(24)
  set focusUidListStr($core.String v) { $_setString(22, v); }
  @$pb.TagNumber(24)
  $core.bool hasFocusUidListStr() => $_has(22);
  @$pb.TagNumber(24)
  void clearFocusUidListStr() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get blackUidListStr => $_getSZ(23);
  @$pb.TagNumber(25)
  set blackUidListStr($core.String v) { $_setString(23, v); }
  @$pb.TagNumber(25)
  $core.bool hasBlackUidListStr() => $_has(23);
  @$pb.TagNumber(25)
  void clearBlackUidListStr() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get blackDynIdListStr => $_getSZ(24);
  @$pb.TagNumber(26)
  set blackDynIdListStr($core.String v) { $_setString(24, v); }
  @$pb.TagNumber(26)
  $core.bool hasBlackDynIdListStr() => $_has(24);
  @$pb.TagNumber(26)
  void clearBlackDynIdListStr() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get worksCount => $_getIZ(25);
  @$pb.TagNumber(27)
  set worksCount($core.int v) { $_setSignedInt32(25, v); }
  @$pb.TagNumber(27)
  $core.bool hasWorksCount() => $_has(25);
  @$pb.TagNumber(27)
  void clearWorksCount() => clearField(27);

  @$pb.TagNumber(28)
  $fixnum.Int64 get monthlyVipExpireAt => $_getI64(26);
  @$pb.TagNumber(28)
  set monthlyVipExpireAt($fixnum.Int64 v) { $_setInt64(26, v); }
  @$pb.TagNumber(28)
  $core.bool hasMonthlyVipExpireAt() => $_has(26);
  @$pb.TagNumber(28)
  void clearMonthlyVipExpireAt() => clearField(28);

  @$pb.TagNumber(29)
  $fixnum.Int64 get yearlyVipExpireAt => $_getI64(27);
  @$pb.TagNumber(29)
  set yearlyVipExpireAt($fixnum.Int64 v) { $_setInt64(27, v); }
  @$pb.TagNumber(29)
  $core.bool hasYearlyVipExpireAt() => $_has(27);
  @$pb.TagNumber(29)
  void clearYearlyVipExpireAt() => clearField(29);

  @$pb.TagNumber(30)
  $core.bool get hasCrown => $_getBF(28);
  @$pb.TagNumber(30)
  set hasCrown($core.bool v) { $_setBool(28, v); }
  @$pb.TagNumber(30)
  $core.bool hasHasCrown() => $_has(28);
  @$pb.TagNumber(30)
  void clearHasCrown() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get coin => $_getIZ(29);
  @$pb.TagNumber(31)
  set coin($core.int v) { $_setSignedInt32(29, v); }
  @$pb.TagNumber(31)
  $core.bool hasCoin() => $_has(29);
  @$pb.TagNumber(31)
  void clearCoin() => clearField(31);
}

class UserListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserListResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'user'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<User>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.PM, subBuilder: User.create)
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasMore', protoName: 'hasMore')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalCount', protoName: 'totalCount')
    ..hasRequiredFields = false
  ;

  UserListResp._() : super();
  factory UserListResp({
    $core.int? code,
    $core.String? message,
    $core.Iterable<User>? data,
    $core.bool? hasMore,
    $fixnum.Int64? totalCount,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    if (totalCount != null) {
      _result.totalCount = totalCount;
    }
    return _result;
  }
  factory UserListResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserListResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserListResp clone() => UserListResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserListResp copyWith(void Function(UserListResp) updates) => super.copyWith((message) => updates(message as UserListResp)) as UserListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserListResp create() => UserListResp._();
  UserListResp createEmptyInstance() => create();
  static $pb.PbList<UserListResp> createRepeated() => $pb.PbList<UserListResp>();
  @$core.pragma('dart2js:noInline')
  static UserListResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserListResp>(create);
  static UserListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<User> get data => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get hasMore => $_getBF(3);
  @$pb.TagNumber(4)
  set hasMore($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHasMore() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasMore() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get totalCount => $_getI64(4);
  @$pb.TagNumber(5)
  set totalCount($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTotalCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalCount() => clearField(5);
}

class UserInfoResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserInfoResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'user'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOM<User>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  UserInfoResp._() : super();
  factory UserInfoResp({
    $core.int? code,
    $core.String? message,
    User? data,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory UserInfoResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfoResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfoResp clone() => UserInfoResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfoResp copyWith(void Function(UserInfoResp) updates) => super.copyWith((message) => updates(message as UserInfoResp)) as UserInfoResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserInfoResp create() => UserInfoResp._();
  UserInfoResp createEmptyInstance() => create();
  static $pb.PbList<UserInfoResp> createRepeated() => $pb.PbList<UserInfoResp>();
  @$core.pragma('dart2js:noInline')
  static UserInfoResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfoResp>(create);
  static UserInfoResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  User get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(User v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  User ensureData() => $_ensure(2);
}

class GenerateNameResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GenerateNameResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'user'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..hasRequiredFields = false
  ;

  GenerateNameResp._() : super();
  factory GenerateNameResp({
    $core.int? code,
    $core.String? message,
    $core.String? data,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory GenerateNameResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateNameResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateNameResp clone() => GenerateNameResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerateNameResp copyWith(void Function(GenerateNameResp) updates) => super.copyWith((message) => updates(message as GenerateNameResp)) as GenerateNameResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenerateNameResp create() => GenerateNameResp._();
  GenerateNameResp createEmptyInstance() => create();
  static $pb.PbList<GenerateNameResp> createRepeated() => $pb.PbList<GenerateNameResp>();
  @$core.pragma('dart2js:noInline')
  static GenerateNameResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateNameResp>(create);
  static GenerateNameResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(3)
  set data($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}

class FriendListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FriendListResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'user'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<User>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'list', $pb.PbFieldType.PM, subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  FriendListResp._() : super();
  factory FriendListResp({
    $core.int? code,
    $core.String? message,
    $core.Iterable<User>? list,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (message != null) {
      _result.message = message;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory FriendListResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FriendListResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FriendListResp clone() => FriendListResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FriendListResp copyWith(void Function(FriendListResp) updates) => super.copyWith((message) => updates(message as FriendListResp)) as FriendListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FriendListResp create() => FriendListResp._();
  FriendListResp createEmptyInstance() => create();
  static $pb.PbList<FriendListResp> createRepeated() => $pb.PbList<FriendListResp>();
  @$core.pragma('dart2js:noInline')
  static FriendListResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FriendListResp>(create);
  static FriendListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<User> get list => $_getList(2);
}

class FocusListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FocusListResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'user'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<User>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'list', $pb.PbFieldType.PM, subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  FocusListResp._() : super();
  factory FocusListResp({
    $core.int? code,
    $core.String? message,
    $core.Iterable<User>? list,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (message != null) {
      _result.message = message;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory FocusListResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FocusListResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FocusListResp clone() => FocusListResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FocusListResp copyWith(void Function(FocusListResp) updates) => super.copyWith((message) => updates(message as FocusListResp)) as FocusListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FocusListResp create() => FocusListResp._();
  FocusListResp createEmptyInstance() => create();
  static $pb.PbList<FocusListResp> createRepeated() => $pb.PbList<FocusListResp>();
  @$core.pragma('dart2js:noInline')
  static FocusListResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FocusListResp>(create);
  static FocusListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<User> get list => $_getList(2);
}

class FansListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FansListResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'user'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<User>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'list', $pb.PbFieldType.PM, subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  FansListResp._() : super();
  factory FansListResp({
    $core.int? code,
    $core.String? message,
    $core.Iterable<User>? list,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (message != null) {
      _result.message = message;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory FansListResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FansListResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FansListResp clone() => FansListResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FansListResp copyWith(void Function(FansListResp) updates) => super.copyWith((message) => updates(message as FansListResp)) as FansListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FansListResp create() => FansListResp._();
  FansListResp createEmptyInstance() => create();
  static $pb.PbList<FansListResp> createRepeated() => $pb.PbList<FansListResp>();
  @$core.pragma('dart2js:noInline')
  static FansListResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FansListResp>(create);
  static FansListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<User> get list => $_getList(2);
}

class UserBlackListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserBlackListResp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'user'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<User>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'list', $pb.PbFieldType.PM, subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  UserBlackListResp._() : super();
  factory UserBlackListResp({
    $core.int? code,
    $core.String? message,
    $core.Iterable<User>? list,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (message != null) {
      _result.message = message;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory UserBlackListResp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserBlackListResp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserBlackListResp clone() => UserBlackListResp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserBlackListResp copyWith(void Function(UserBlackListResp) updates) => super.copyWith((message) => updates(message as UserBlackListResp)) as UserBlackListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserBlackListResp create() => UserBlackListResp._();
  UserBlackListResp createEmptyInstance() => create();
  static $pb.PbList<UserBlackListResp> createRepeated() => $pb.PbList<UserBlackListResp>();
  @$core.pragma('dart2js:noInline')
  static UserBlackListResp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserBlackListResp>(create);
  static UserBlackListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<User> get list => $_getList(2);
}

