
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:login/src/password_setting_page.dart';
import 'package:admin_backend/api/login_api.dart';
import '../protobuf/generated/adminUser.pb.dart';
import '../util/toast_util.dart';
import '../util/util.dart';
import '../widget/button.dart';
import './widget/get_sms_code_widget.dart';
import 'dart:ui' as ui;


class RegisterPage extends StatefulWidget {
  static Future show(BuildContext context, {String? phone, String? areaCode,
      String? conuntryISOCode,String ?email}) {
    return Navigator.of(context).push(
      MaterialPageRoute<bool>(
        builder: (context) => RegisterPage(
          phone: phone,
          areaCode: areaCode,
          conuntryISOCode: conuntryISOCode,
          email: email,
        ),
        settings: const RouteSettings(name: '/RegisterPage'),
      ),
    );
  }

  final String? phone;
  final String? areaCode;
  final String? conuntryISOCode;
  final String? email;
  const RegisterPage({
    super.key,
    required this.phone,
    required this.areaCode,
    required this.conuntryISOCode, this.email,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<RegisterPage> {
  final FocusNode _focusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    if(widget.email==null) {
      _countryISOCode = widget.conuntryISOCode;
      _phone = widget.phone;
      _areaCode = widget.areaCode;
    }else {
      _email = widget.email;
    }
    _focusNode.requestFocus();
  }

  String? _email;
   String? _phone;
   String? _areaCode;
   String? _countryISOCode;
  String? _smsCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          if(_email!=null)
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
          if(_areaCode!=null&&_phone!=null){
            phoneCompleteNumber = '$_areaCode-${_phone}';
          }
          AdminUserInfoResp? resp = await LoginAPI.register(
              phoneCompleteNumber: phoneCompleteNumber,email: _email, smsCode: _smsCode);
          if (resp != null) {
            //注册成功，跳密码设置页面
            if (!mounted) return;
            // PasswordSettingPage.show(Constant.context);
            // if(_countryISOCode!=null) {
            //   Session.countryIsoCode = _countryISOCode!;
            // }
            // Session.userInfo = resp!.data;
            // eventCenter.emit('userInfoChanged');
          }
        },
        child: Button(
          title: '下一步',
          buttonSize: ButtonSize.Big,
          disabled: !false
        ));
  }


  Widget _buildEmailTextField() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: TextFormField(
        obscureText: false,
        enabled: false,
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
      phone: _phone,
      email: _email,
      smsType: 'register',
    );
  }

}
