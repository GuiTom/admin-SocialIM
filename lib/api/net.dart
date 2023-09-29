import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'package:dog/dog.dart';
import 'package:flutter/foundation.dart';
import 'package:protobuf/protobuf.dart' as $pb;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'dart:ui' as ui;
import '../locale/k.dart';
import '../constant.dart';
import '../model/session.dart';
import '../util/toast_util.dart';

// import 'package:http_requests/http_requests.dart';
import 'dart:js';

class Net {
  static int LOGIC_ERROR_NO_RECORD = -4;
  static const LOGIC_ERROR_NO_PASSWARD = -9;
  static int LOGIC_ERROR_FAIL = -1;
  static int LOGIC_ERROR_AUTH_FAIL = -401;
  static int LOGIC_REQUEST_PARAMS_ERROS = -8;
  static int ERROR_DB_CONNET_ERROR = -3;
  static int ERROR_AGORA_ERROR = -7;
  static int ERROR_OTHER = -5;

  static Future<T> post<T extends $pb.GeneratedMessage>(
      {required String url,
      required bool pb,
      required Map<String, dynamic> params,
      required T pbMsg}) async {
    var headers = {
      'Content-Type': "application/x-www-form-urlencoded",
    };
    params['pb'] = pb ? '1' : '0';
    params['lan'] = ui.window.locale.languageCode;
    context['console'].callMethod('log', ['开始调用']);
    JsObject(context['getDartCall'], [url, jsonEncode(params)]);
    Completer completer = new Completer();
    context['jsCallBack'] = (response,responseData) {
      print(response);
      completer.complete(Future.value({'response':response,'responseData':responseData}));
    };

    try {
      var response = await completer.future;
      if (response != null && response is JsObject) {
        // 获取响应中的二进制数据部分
        if (response['status'] == 200) {
          // final Uint8List data =
          //     Uint8List.fromList(response['data']);
          // pbMsg.mergeFromBuffer(data);
        } else {
          // 处理错误或无效的响应
          print('response:$response');
        }
      }
    } catch (error) {
      if (error is DioError) {
        if (error.response?.statusCode == 401) {
          ToastUtil.showCenter(msg: K.getTranslation('login_session_expired'));
          Session.logOut();
        }
        if (error.type == DioExceptionType.connectionTimeout) {
          ToastUtil.showCenter(
              msg: K.getTranslation('network_connect_timeout'));
        } else if (error.type == DioExceptionType.receiveTimeout) {
          ToastUtil.showCenter(
              msg: K.getTranslation('netowrk_response_timeout'));
        } else {
          ToastUtil.showCenter(msg: K.getTranslation('network_link_error'));
        }
      }
      dog.d(error);
    }
    return pbMsg;
  }

  static Dio? _dio;

  static Dio get dio {
    if (_dio == null) {
      _dio = Dio();
      if (!kIsWeb) {
        final cookieJar = PersistCookieJar(
            storage: FileStorage(Constant.documentsDirectory?.path));
        _dio!.interceptors.add(CookieManager(cookieJar));
      }
    }
    return _dio!;
  }
}
