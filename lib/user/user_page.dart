import 'package:flutter/material.dart';

import '../api/net.dart';
import '../config.dart';
import '../model/menu_model.dart';

import 'package:flutter/cupertino.dart';

import '../protobuf/generated/common.pb.dart';
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
    Net.post(url: '', pb: true, params: {}, pbMsg:Resp.create() );
  }

  @override
  Widget build(BuildContext context) {
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
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Colors.white,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 5,
                      color: Colors.grey,
                    );
                  },
                  itemCount: 3)),
        ],
      ),
    );
  }
}
