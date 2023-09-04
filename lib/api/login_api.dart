import 'dart:io';

import '../constant.dart';
import '../protobuf/generated/user.pb.dart';
import '../util/system.dart';
import '../util/toast_util.dart';
import 'net.dart';

class LoginAPI{
  static Future<UserInfoResp?> login(
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
    params['isIos'] = 0;
    UserInfoResp resp = await Net.post(
        url: System.api("/api/user/login"),
        pb: true,
        params: params,
        pbMsg: UserInfoResp.create());
    if (resp.code == 1) {
      return resp;
    } else {
      ToastUtil.showCenter(msg: resp.message);
    }
    return null;
  }
}