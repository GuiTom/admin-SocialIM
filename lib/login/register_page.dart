import 'package:admin_backend/login/password_setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:login/src/password_setting_page.dart';
import 'package:admin_backend/api/login_api.dart';
import '../constant.dart';
import '../model/session.dart';
import '../protobuf/generated/adminUser.pb.dart';
import '../util/events.dart';
import '../util/toast_util.dart';
import '../util/util.dart';
import '../widget/button.dart';
import './widget/get_sms_code_widget.dart';
import 'dart:ui' as ui;

class RegisterPage extends StatefulWidget {
  static Future show(
    BuildContext context,
  ) {
    return Navigator.of(context).push(
      MaterialPageRoute<bool>(
        builder: (context) => const RegisterPage(),
        settings: const RouteSettings(name: '/RegisterPage'),
      ),
    );
  }

  const RegisterPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<RegisterPage> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.requestFocus();
  }

  String? _email;
  String? _phone;
  String? _areaCode;
  String? _smsCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          width: 500,
          height: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "帐号注册",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              _buildEmailTextField(),
              const SizedBox(
                height: 10,
              ),
              _buildSmsCodeWidget(),
              const SizedBox(
                height: 30,
              ),
              _buildNextStepButton(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextStepButton() {
    return GestureDetector(
        onTap: () async {
          if (!Util.isVerifyCode(_smsCode ?? '')) {
            ToastUtil.showCenter(msg: '请输入4位数验证码');
            return;
          }
          String? phoneCompleteNumber = null;
          if (_areaCode != null && _phone != null) {
            phoneCompleteNumber = '$_areaCode-${_phone}';
          }
          AdminUserInfoResp? resp = await LoginApi.register(
              phoneCompleteNumber: phoneCompleteNumber,
              email: _email,
              smsCode: _smsCode);
          if (resp != null) {
            //注册成功，跳密码设置页面
            if (!mounted) return;
            PasswordSettingPage.show(Constant.context);
            Session.userInfo = resp!.data;
            eventCenter.emit('userInfoChanged');
          }
        },
        child: Button(
            title: '下一步', buttonSize: ButtonSize.Big, disabled: Util.isVerifyCode(_smsCode??'')));
  }

  Widget _buildEmailTextField() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: TextFormField(
        obscureText: false,
        enabled: true,
        initialValue: _email,
        keyboardType: TextInputType.text,
        style: const TextStyle(
          fontSize: 18,
          letterSpacing: 1,
          color: Colors.black,
        ),
        decoration: const InputDecoration(
          labelText: '输入邮箱地址',
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        onChanged: (String value){
          _email = value;
          setState(() {

          });
        },
      ),
    );
  }

  Widget _buildSmsCodeWidget() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: TextFormField(
        obscureText: false,
        focusNode: _focusNode,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 18,
          letterSpacing: 1,
          color: Colors.black,
        ),
        onChanged: (value) {
          _smsCode = value;
        },
        decoration: InputDecoration(
          labelText: '输入4位数验证码',
          suffix: _buildGetSmsCodeButton(),
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }

  Widget _buildGetSmsCodeButton() {
    return GetSmsCodeWidget(
      areaCode: _areaCode,
      email: _email,
      smsType: 'admin_register',
    );
  }
}
