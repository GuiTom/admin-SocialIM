import 'package:admin_backend/api/user_api.dart';
import 'package:admin_backend/util/system.dart';
import 'package:flutter/material.dart';

import '../api/net.dart';
import '../config.dart';
import '../model/menu_model.dart';

import 'package:flutter/cupertino.dart';

import '../protobuf/generated/common.pb.dart';
import '../protobuf/generated/user.pb.dart';
import '../util/util.dart';
import '../widget/button.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    _getUserList();
  }

  final List<User> _userList = [];

  Future _getUserList() async {
    UserListResp? resp = await UserAPI.getUserList(1, 20);
    if (resp?.code == 1 ?? false) {
      _userList.addAll(resp!.data);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_userList.isEmpty) {
      return const CupertinoActivityIndicator(
        radius: 50,
      );
    }
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      width: Util.width - 155,
      child: Column(
        children: [
          Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withOpacity(0.5),
              ),
              child: const Center(
                  child: Text(
                '用户管理',
                style: TextStyle(fontWeight: FontWeight.w600),
              ))),
          _buildTableHeader(),
          Container(
            height: 5,
            color: Colors.grey.withOpacity(0.1),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: _buildRow,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 5,
                      color: Colors.grey.withOpacity(0.1),
                    );
                  },
                  itemCount: _userList.length)),
          Button(
            onTap: () {

            },
            title: "确定",
            buttonSize: ButtonSize.Small,
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ['id', '昵称', '性别', '地区']
            .map((e) => Expanded(
                    child: SelectableText(
                  e,
                  textAlign: TextAlign.center,
                )))
            .toList(),
      ),
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    User user = _userList[index];
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          user.id.toString(),
          user.name,
          user.sex.toString(),
          user.countryName
        ]
            .map((e) => Expanded(child: SelectableText(e, textAlign: TextAlign.center)))
            .toList(),
      ),
    );
  }
}
