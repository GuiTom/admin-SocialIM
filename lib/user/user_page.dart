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
    return SizedBox(
      width: Util.width - 155,
      child: Column(
        children: [
          Container(
              color: Colors.white, child: const Center(child: Text('发现管理1'))),
          Container(
            height: 5,
            color: Colors.grey,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: _buildRow,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 5,
                      color: Colors.grey,
                    );
                  },
                  itemCount: _userList.length)),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    User user = _userList[index];
    return Container(
      height: 50,
      color: Colors.white,
      child: Text(user.name),
    );
  }

}
