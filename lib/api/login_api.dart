import 'dart:io';

import '../constant.dart';
import '../protobuf/generated/adminUser.pb.dart';
import '../protobuf/generated/common.pb.dart';
import '../util/system.dart';
import '../util/toast_util.dart';
import 'net.dart';

class LoginAPI{
  static Future<AdminUserInfoResp?> login(
      {
        String? smsCode,
        String? email,
        String? password}) async {
    Map<String, dynamic> params = {};

    if (email != null) {
      params['email'] = email;
    }
    if (password != null) {
      params['password'] = password;
    } else {
      params['code'] = smsCode;
    }
    AdminUserInfoResp resp = await Net.post(
        url: System.api("/api/adminUser/login"),
        pb: true,
        params: params,
        pbMsg: AdminUserInfoResp.create());
    if (resp.code == 1) {
      return resp;
    } else {
      ToastUtil.showCenter(msg: resp.message);
    }
    return null;
  }
  static Future<AdminUserInfoResp?> register(
      {String? phoneCompleteNumber, String? smsCode, String? email}) async {
    Map<String, dynamic> params = {'sms_code': smsCode};
    if (phoneCompleteNumber != null) {
      params['phone'] = phoneCompleteNumber!;
    }
    if (email != null) {
      params['email'] = email!;
    }

    AdminUserInfoResp resp = await Net.post(
        url: System.api("/api/adminUser/register"),
        pb: true,
        params: params,
        pbMsg: AdminUserInfoResp.create());
    if (resp.code == 1) {
      return resp;
    } else {
      ToastUtil.showCenter(msg: resp.message);
    }
    return null;
  }
  static Future<Resp> getSmsCode(
      {required areaCode, required mobile, required String type}) async {
    Resp resp = await Net.post(
        url: System.api('/api/adminUser/getSmsCode'),
        pb: true,
        params: {'phone': '$areaCode-$mobile', 'type': type},
        pbMsg: Resp.create());
    return resp;
  }
  static Future<Resp> getEmailCode(
      {required String email,required String type}) async {
    Resp resp = await Net.post(
        url: System.api('/api/user/getEmailCode'),
        pb: true,
        params: {'email': email, 'type': type},
        pbMsg: Resp.create());
    return resp;
  }
}