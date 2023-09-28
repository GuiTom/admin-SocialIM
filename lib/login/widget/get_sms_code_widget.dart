import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../api/login_api.dart';
import '../../protobuf/generated/common.pb.dart';
import '../../util/toast_util.dart';


class GetSmsCodeWidget extends StatefulWidget {
  final String? areaCode;
  final String? phone;
  final String? email;
  final String smsType;

  const GetSmsCodeWidget(
      {super.key,
      this.areaCode,
      this.phone,
      this.email,
      required this.smsType});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<GetSmsCodeWidget> {
  Timer? _timer;
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!(_timer?.isActive ?? false)) {
      return GestureDetector(
        onTap: () async {
          if (widget.email == null) {
            Resp resp = await LoginAPI.getSmsCode(
                areaCode: widget.areaCode,
                mobile: widget.phone,
                type: widget.smsType);
            if (resp.code == 1) {
              _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                if (timer.tick >= 60) {
                  timer.cancel();
                  setState(() {});
                }
              });
              setState(() {});
            }
            ToastUtil.showCenter(msg: '验证码已发送');
          } else {
            Resp resp = await LoginAPI.getEmailCode(
                email: widget.email!, type: widget.smsType);
            if (resp.code == 1) {
              _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                if (timer.tick >= 60) {
                  timer.cancel();
                  setState(() {});
                }
              });
              setState(() {});
            }
            ToastUtil.showCenter(msg: '验证码已发送');
          }
        },
        child: Text(
          '获取验证码',
          style: widget.email == null && widget.phone == null
              ? const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0x3F111111))
              : const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      );
    } else {
      return Text(
       '${60 - (_timer?.tick ?? 0)}秒后重发',
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0x3F111111)),
      );
    }
    ;
  }
}
