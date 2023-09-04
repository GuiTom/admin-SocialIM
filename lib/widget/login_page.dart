import 'package:admin_backend/api/login_api.dart';
import 'package:admin_backend/protobuf/generated/user.pb.dart';
import 'package:admin_backend/util/events.dart';
import 'package:admin_backend/util/toast_util.dart';
import 'package:flutter/material.dart';

import '../locale/k.dart';
import '../model/session.dart';
import '../util/prefs_helper.dart';
import '../util/util.dart';
import 'button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LoginPage> {
  String? _email;
  String? _password;
  @override
  void initState() {
    super.initState();
    _email = PrefsHelper.getString('lastAccount');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        width: 500,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('登录'),
            const SizedBox(
              height: 50,
            ),
            _buildEmailTextField(),
            const SizedBox(
              height: 20,
            ),
            _buildPaswordTextField(),
            const SizedBox(
              height: 20,
            ),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: TextFormField(
        obscureText: false,
        initialValue: _email,
        keyboardType: TextInputType.text,
        style: const TextStyle(
          fontSize: 18,
          letterSpacing: 1,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: K.getTranslation('enter_email'),
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        onChanged: (String value){
          _email = value;
        },
      ),
    );
  }

  Widget _buildPaswordTextField() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: TextFormField(
        obscureText: true,
        keyboardType: TextInputType.text,
        style: const TextStyle(
          fontSize: 18,
          letterSpacing: 1,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: K.getTranslation('enter_password'),
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        onChanged: (String value){
          _password = value;
        },
      ),
    );
  }
  Widget _buildLoginButton(){
    return InkWell(
      onTap: () async{
        if(_email==null||_email!.isEmpty){
          ToastUtil.showCenter(msg: '请输入邮箱地址');
          return;
        }
        if(_password==null||_password!.isEmpty){
          ToastUtil.showCenter(msg: '请输入密码');
          return;
        }
       UserInfoResp?  resp = await LoginAPI.login(email: _email,password: Util.cryptPwd(_password!));
       if(resp?.code==1??false){
         Session.userInfo = resp!.data;
         eventCenter.emit('userInfoChanged');
         PrefsHelper.setString('lastAccount', _email!);
       }
      },
      child: Button(
          title: K.getTranslation('login'),
          buttonSize: ButtonSize.Big),
    );
  }
}
