import '../model/session.dart';
import '../protobuf/generated/user.pb.dart';
import '../util/system.dart';
import '../util/toast_util.dart';
import 'net.dart';

class UserAPI {
  static Future<UserListResp> getUserList(int pageNo, int pageSize) async {
    UserListResp userListResp = await Net.post(
        url: System.api('/api/user/list'),
        pb: true,
        params: {
          'sex': 0,
          'uid': Session.uid,
          'pageNo': pageNo,
          'pageSize': pageSize
        },
        pbMsg: UserListResp.create());
    if (userListResp.code != 1) {
      ToastUtil.showCenter(msg: userListResp.message);
    }
    return userListResp;
  }
}