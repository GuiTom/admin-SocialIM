
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../api/login_api.dart';
import '../model/session.dart';
import '../protobuf/generated/common.pb.dart';
import '../util/toast_util.dart';
import '../util/util.dart';
import '../widget/button.dart';


class PasswordSettingPage extends StatefulWidget {
  const PasswordSettingPage({super.key});

  static Future show(
    BuildContext context,
  ) {
    return Navigator.of(context).push(
      MaterialPageRoute<bool>(
        builder: (context) => const PasswordSettingPage(),
        settings: const RouteSettings(name: '/PasswordSettingPage'),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PasswordSettingPage> {
  String? _firstPassword;
  String? _secondPassword;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '密码设置',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              _buildPasswordTextFieldWidget(true),
              const SizedBox(
                height: 30,
              ),
              _buildPasswordTextFieldWidget(false),
              const SizedBox(
                height: 40,
              ),
              _buildNextStepButton(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextFieldWidget(bool isFirst) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: TextFormField(
        obscureText: true,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 18,
          letterSpacing: 1,
          color: Colors.black,
        ),
        onChanged: (value) {
          if (isFirst) {
            _firstPassword = value;
          } else {
            _secondPassword = value;
          }
        },
        validator: (value) {
          if (isFirst) {
            if (Util.isVerifyPwd(value ?? '')) {
              return '密码长度不够';
            }
          } else {
            if ((_firstPassword?.isNotEmpty ?? false) &&
                (value?.isNotEmpty ?? false) &&
                !_firstPassword!.startsWith(value!)) {
              return "两次输入的输入的密码不相同";
            }
          }
        },
        decoration: InputDecoration(
          labelText: isFirst
              ? '密码设置'
              : '密码确认',
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }

  Widget _buildNextStepButton() {
    return GestureDetector(
        onTap: () async {
          if (_firstPassword != _secondPassword) {
            ToastUtil.showCenter(msg: '两次输入的密码不一样');
            return;
          }
          if (!Util.isVerifyPwd(_secondPassword ?? '')) {
            ToastUtil.showCenter(
                msg: '输入6位数密码');
            return;
          }

          Resp? resp = await LoginApi.setPassword(
              uid: Session.uid, password: _secondPassword!);
          if (resp?.code == 1) {
            Session.passwordSetted = true;
            //登录成功，跳首页
            if (!mounted) return;

              Navigator.popUntil(context, ModalRoute.withName('/'));

          }
        },
        child: const Button(
          title: '下一步',
          buttonSize: ButtonSize.Big,
        ));
  }
}
