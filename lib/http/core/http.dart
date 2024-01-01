import 'package:flutter/cupertino.dart';
import 'package:qinglong_tools/http/core/http_adapter.dart';

import '../request/base_request.dart';
import 'dio_adapter.dart';
import 'http_error.dart';

class Http {
  Http._();
  static Http? _instance;
  static Http getInstance() {
    _instance ??= Http._();
    return _instance!;
  }

  late String token;
  void setToken(String token) {
    this.token = token;
  }

  Future fire(BaseRequest request) async {
    HttpResponse? response;
    Object? error;
    try {
      if (request.needLogin()) {
        request.addHeader("Authorization", "Bearer $token");
      }
      response = await send(request);
    } on HttpError catch (e) {
      error = e;
      response = e.data;
    } catch (e) {
      error = e;
    }
    if (response == null) {
      printLog(error);
    }
    var result = response?.data;
    var status = response?.statusCode;

    switch (status) {
      case 200:
        return result;
      case 401:
        debugPrint('NeedLogin');
        return NeedLogin();
      default:
        throw HttpError(status ?? 404, result.toString(), data: result);
    }
  }

  Future<dynamic> send<T>(BaseRequest request) async {
    HttpAdapter adapter = DioAdapter();
    return adapter.send(request);
  }

  void printLog(msg) {
    debugPrint('[http] $msg');
  }
}
