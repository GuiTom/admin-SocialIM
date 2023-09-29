///
//  Generated code. Do not modify.
//  source: adminUser.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use adminUserDescriptor instead')
const AdminUser$json = const {
  '1': 'AdminUser',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 4, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'priviledge', '3': 5, '4': 1, '5': 5, '10': 'priviledge'},
    const {'1': 'passwordSetted', '3': 6, '4': 1, '5': 8, '10': 'passwordSetted'},
  ],
};

/// Descriptor for `AdminUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminUserDescriptor = $convert.base64Decode('CglBZG1pblVzZXISDgoCaWQYASABKANSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFAoFZW1haWwYAyABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAQgASgJUghwYXNzd29yZBIeCgpwcml2aWxlZGdlGAUgASgFUgpwcml2aWxlZGdlEiYKDnBhc3N3b3JkU2V0dGVkGAYgASgIUg5wYXNzd29yZFNldHRlZA==');
@$core.Deprecated('Use adminUserInfoRespDescriptor instead')
const AdminUserInfoResp$json = const {
  '1': 'AdminUserInfoResp',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'data', '3': 3, '4': 1, '5': 11, '6': '.user.AdminUser', '10': 'data'},
  ],
};

/// Descriptor for `AdminUserInfoResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminUserInfoRespDescriptor = $convert.base64Decode('ChFBZG1pblVzZXJJbmZvUmVzcBISCgRjb2RlGAEgASgFUgRjb2RlEhgKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2USIwoEZGF0YRgDIAEoCzIPLnVzZXIuQWRtaW5Vc2VyUgRkYXRh');
