import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void showCenter({required String msg}) {
    if (msg.isEmpty) return;
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
  }

  static void showTop({required String msg}) {
    if (msg.isEmpty) return;
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.TOP);
  }

  static void showBottom({required String msg}) {
    if (msg.isEmpty) return;
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.BOTTOM);
  }
}
