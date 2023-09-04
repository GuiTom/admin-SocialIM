///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'sex', '3': 3, '4': 1, '5': 5, '10': 'sex'},
    const {'1': 'height', '3': 4, '4': 1, '5': 5, '10': 'height'},
    const {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'phone', '3': 6, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'headId', '3': 8, '4': 1, '5': 9, '10': 'headId'},
    const {'1': 'level', '3': 9, '4': 1, '5': 5, '10': 'level'},
    const {'1': 'wealth', '3': 10, '4': 1, '5': 5, '10': 'wealth'},
    const {'1': 'bornAt', '3': 11, '4': 1, '5': 3, '10': 'bornAt'},
    const {'1': 'signature', '3': 12, '4': 1, '5': 9, '10': 'signature'},
    const {'1': 'cityCode', '3': 13, '4': 1, '5': 9, '10': 'cityCode'},
    const {'1': 'provinceCode', '3': 14, '4': 1, '5': 9, '10': 'provinceCode'},
    const {'1': 'countryCode', '3': 15, '4': 1, '5': 9, '10': 'countryCode'},
    const {'1': 'cityName', '3': 16, '4': 1, '5': 9, '10': 'cityName'},
    const {'1': 'provinceName', '3': 17, '4': 1, '5': 9, '10': 'provinceName'},
    const {'1': 'countryName', '3': 18, '4': 1, '5': 9, '10': 'countryName'},
    const {'1': 'setting', '3': 19, '4': 1, '5': 9, '10': 'setting'},
    const {'1': 'passwordSetted', '3': 20, '4': 1, '5': 8, '10': 'passwordSetted'},
    const {'1': 'toUnRegister', '3': 21, '4': 1, '5': 8, '10': 'toUnRegister'},
    const {'1': 'friendUidListStr', '3': 22, '4': 1, '5': 9, '10': 'friendUidListStr'},
    const {'1': 'fansUidListStr', '3': 23, '4': 1, '5': 9, '10': 'fansUidListStr'},
    const {'1': 'focusUidListStr', '3': 24, '4': 1, '5': 9, '10': 'focusUidListStr'},
    const {'1': 'blackUidListStr', '3': 25, '4': 1, '5': 9, '10': 'blackUidListStr'},
    const {'1': 'blackDynIdListStr', '3': 26, '4': 1, '5': 9, '10': 'blackDynIdListStr'},
    const {'1': 'worksCount', '3': 27, '4': 1, '5': 5, '10': 'worksCount'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEg4KAmlkGAEgASgDUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhAKA3NleBgDIAEoBVIDc2V4EhYKBmhlaWdodBgEIAEoBVIGaGVpZ2h0EhQKBWVtYWlsGAUgASgJUgVlbWFpbBIUCgVwaG9uZRgGIAEoCVIFcGhvbmUSFgoGaGVhZElkGAggASgJUgZoZWFkSWQSFAoFbGV2ZWwYCSABKAVSBWxldmVsEhYKBndlYWx0aBgKIAEoBVIGd2VhbHRoEhYKBmJvcm5BdBgLIAEoA1IGYm9ybkF0EhwKCXNpZ25hdHVyZRgMIAEoCVIJc2lnbmF0dXJlEhoKCGNpdHlDb2RlGA0gASgJUghjaXR5Q29kZRIiCgxwcm92aW5jZUNvZGUYDiABKAlSDHByb3ZpbmNlQ29kZRIgCgtjb3VudHJ5Q29kZRgPIAEoCVILY291bnRyeUNvZGUSGgoIY2l0eU5hbWUYECABKAlSCGNpdHlOYW1lEiIKDHByb3ZpbmNlTmFtZRgRIAEoCVIMcHJvdmluY2VOYW1lEiAKC2NvdW50cnlOYW1lGBIgASgJUgtjb3VudHJ5TmFtZRIYCgdzZXR0aW5nGBMgASgJUgdzZXR0aW5nEiYKDnBhc3N3b3JkU2V0dGVkGBQgASgIUg5wYXNzd29yZFNldHRlZBIiCgx0b1VuUmVnaXN0ZXIYFSABKAhSDHRvVW5SZWdpc3RlchIqChBmcmllbmRVaWRMaXN0U3RyGBYgASgJUhBmcmllbmRVaWRMaXN0U3RyEiYKDmZhbnNVaWRMaXN0U3RyGBcgASgJUg5mYW5zVWlkTGlzdFN0chIoCg9mb2N1c1VpZExpc3RTdHIYGCABKAlSD2ZvY3VzVWlkTGlzdFN0chIoCg9ibGFja1VpZExpc3RTdHIYGSABKAlSD2JsYWNrVWlkTGlzdFN0chIsChFibGFja0R5bklkTGlzdFN0chgaIAEoCVIRYmxhY2tEeW5JZExpc3RTdHISHgoKd29ya3NDb3VudBgbIAEoBVIKd29ya3NDb3VudA==');
@$core.Deprecated('Use userListRespDescriptor instead')
const UserListResp$json = const {
  '1': 'UserListResp',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'data', '3': 3, '4': 3, '5': 11, '6': '.user.User', '10': 'data'},
    const {'1': 'hasMore', '3': 4, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `UserListResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userListRespDescriptor = $convert.base64Decode('CgxVc2VyTGlzdFJlc3ASEgoEY29kZRgBIAEoBVIEY29kZRIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdlEh4KBGRhdGEYAyADKAsyCi51c2VyLlVzZXJSBGRhdGESGAoHaGFzTW9yZRgEIAEoCFIHaGFzTW9yZQ==');
@$core.Deprecated('Use userInfoRespDescriptor instead')
const UserInfoResp$json = const {
  '1': 'UserInfoResp',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'data', '3': 3, '4': 1, '5': 11, '6': '.user.User', '10': 'data'},
  ],
};

/// Descriptor for `UserInfoResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoRespDescriptor = $convert.base64Decode('CgxVc2VySW5mb1Jlc3ASEgoEY29kZRgBIAEoBVIEY29kZRIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdlEh4KBGRhdGEYAyABKAsyCi51c2VyLlVzZXJSBGRhdGE=');
@$core.Deprecated('Use generateNameRespDescriptor instead')
const GenerateNameResp$json = const {
  '1': 'GenerateNameResp',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'data', '3': 3, '4': 1, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `GenerateNameResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateNameRespDescriptor = $convert.base64Decode('ChBHZW5lcmF0ZU5hbWVSZXNwEhIKBGNvZGUYASABKAVSBGNvZGUSGAoHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZRISCgRkYXRhGAMgASgJUgRkYXRh');
@$core.Deprecated('Use friendListRespDescriptor instead')
const FriendListResp$json = const {
  '1': 'FriendListResp',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'list', '3': 3, '4': 3, '5': 11, '6': '.user.User', '10': 'list'},
  ],
};

/// Descriptor for `FriendListResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List friendListRespDescriptor = $convert.base64Decode('Cg5GcmllbmRMaXN0UmVzcBISCgRjb2RlGAEgASgFUgRjb2RlEhgKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2USHgoEbGlzdBgDIAMoCzIKLnVzZXIuVXNlclIEbGlzdA==');
@$core.Deprecated('Use focusListRespDescriptor instead')
const FocusListResp$json = const {
  '1': 'FocusListResp',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'list', '3': 3, '4': 3, '5': 11, '6': '.user.User', '10': 'list'},
  ],
};

/// Descriptor for `FocusListResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List focusListRespDescriptor = $convert.base64Decode('Cg1Gb2N1c0xpc3RSZXNwEhIKBGNvZGUYASABKAVSBGNvZGUSGAoHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZRIeCgRsaXN0GAMgAygLMgoudXNlci5Vc2VyUgRsaXN0');
@$core.Deprecated('Use fansListRespDescriptor instead')
const FansListResp$json = const {
  '1': 'FansListResp',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'list', '3': 3, '4': 3, '5': 11, '6': '.user.User', '10': 'list'},
  ],
};

/// Descriptor for `FansListResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fansListRespDescriptor = $convert.base64Decode('CgxGYW5zTGlzdFJlc3ASEgoEY29kZRgBIAEoBVIEY29kZRIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdlEh4KBGxpc3QYAyADKAsyCi51c2VyLlVzZXJSBGxpc3Q=');
@$core.Deprecated('Use userBlackListRespDescriptor instead')
const UserBlackListResp$json = const {
  '1': 'UserBlackListResp',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'list', '3': 3, '4': 3, '5': 11, '6': '.user.User', '10': 'list'},
  ],
};

/// Descriptor for `UserBlackListResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userBlackListRespDescriptor = $convert.base64Decode('ChFVc2VyQmxhY2tMaXN0UmVzcBISCgRjb2RlGAEgASgFUgRjb2RlEhgKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2USHgoEbGlzdBgDIAMoCzIKLnVzZXIuVXNlclIEbGlzdA==');
