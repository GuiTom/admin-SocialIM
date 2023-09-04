import 'dart:typed_data';
import 'package:dog/dog.dart';
import 'package:flutter/foundation.dart';
import 'package:protobuf/protobuf.dart' as $pb;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'dart:ui' as ui;

import '../constant.dart';
import '../util/toast_util.dart';

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
    var headers = {'Content-Type': "application/x-www-form-urlencoded"};
    params['pb'] = pb ? '1' : '0';
    params['lan'] = ui.window.locale.languageCode;
    params['country'] = ui.window.locale.countryCode;
    try {
      var response = await dio.post(
        url,
        options: Options(
            headers: headers,
            responseType: pb ? ResponseType.bytes : ResponseType.json),
        data: FormData.fromMap(params),
      );

      if (response.statusCode == 200) {
        if (pb) {
          pbMsg.mergeFromBuffer(response.data);
        } else {
          pbMsg.mergeFromJson(response.data);
        }
      }
    } catch (error) {
      if (error is DioError) {
        if (error.response?.statusCode == 401) {
          ToastUtil.showCenter(msg: '会话已过期');
          // Session.logOut();
        }
        if (error.type == DioErrorType.other) {
          ToastUtil.showCenter(msg: '网络错误');
        } else if (error.type == DioErrorType.connectTimeout) {
          ToastUtil.showCenter(
              msg: '网络连接超时');
        } else if (error.type == DioErrorType.receiveTimeout) {
          ToastUtil.showCenter(
              msg: '网络响应超时');
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
      if(!kIsWeb) {
        final cookieJar = PersistCookieJar(
            storage: FileStorage(Constant.documentsDirectory?.path));

        _dio!.interceptors.add(CookieManager(cookieJar));
      }
    }
    return _dio!;
  }

  static Future<T> uploadFile<T extends $pb.GeneratedMessage>({
    required String url,
    String filePath = '',
    required bool pb,
    Uint8List? bytes,
    String? fileName,
    required Map<String, dynamic> params,
    required T pbMsg,
  }) async {
    if (bytes?.isNotEmpty ?? false) {
      params['file'] =
          MultipartFile.fromBytes(bytes!.cast<int>(), filename: fileName);
    } else {
      File file = File(filePath); // 替换为你要上传的文件路径
      fileName = file.path.split('/').last;
      params['file'] =
          await MultipartFile.fromFile(file.path, filename: fileName);
    }
    params['lan'] = ui.window.locale.languageCode;
    params['country'] = ui.window.locale.countryCode;
    FormData formData = FormData.fromMap(params);
    try {
      Response response = await dio.post(
        url, // 替换为实际的文件上传接口URL
        options:
            Options(responseType: pb ? ResponseType.bytes : ResponseType.json),
        data: formData,
      );
      if (response.statusCode == 200) {
        if (pb) {
          pbMsg.mergeFromBuffer(response.data);
        } else {
          pbMsg.mergeFromJson(response.data);
        }
      }
    } catch (error) {
      print('文件上传失败：$error');
    }
    return pbMsg;
  }

  static Future<T> uploadMultiFile<T extends $pb.GeneratedMessage>({
    required String url,
    required List<String> filePaths,
    required bool pb,
    String? fileName,
    required Map<String, dynamic> params,
    required T pbMsg,
  }) async {
    int index = 0;
    for (String filePath in filePaths) {
      File file = File(filePath); // 替换为你要上传的文件路径
      fileName = file.path.split('/').last;
      params['file_$index'] =
          await MultipartFile.fromFile(file.path, filename: fileName);
      index += 1;
    }
    params['lan'] = ui.window.locale.languageCode;
    FormData formData = FormData.fromMap(params);
    try {
      Response response = await dio.post(
        url, // 替换为实际的文件上传接口URL
        options:
            Options(responseType: pb ? ResponseType.bytes : ResponseType.json),
        data: formData,
      );
      if (response.statusCode == 200) {
        if (pb) {
          pbMsg.mergeFromBuffer(response.data);
        } else {
          pbMsg.mergeFromJson(response.data);
        }
      }
    } catch (error) {
      print('文件上传失败：$error');
    }
    return pbMsg;
  }

  static Future<bool?> download(
      String url, String savePath, ProgressCallback progressCallback) async {
    Response resp =
        await dio.download(url, savePath, onReceiveProgress: progressCallback);
    if (resp.statusCode == 200) {
      return true;
    }
    return false;
  }
}
