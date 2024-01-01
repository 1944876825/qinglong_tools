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

  Future fire(BaseRequest request) async {
    HttpResponse? response;
    Object? error;
    try {
      if (request.needLogin()) {
        request.addHeader("Authorization",
            "Bearer eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoid05zQ0JxbHdTeDNCQW11bzZxR3FJU05FUzRTR09OT3l4ZzlXaUhCX250S2xrRUg2N21jNm9UeGx5RzJmN0JhNG0xejE1eURiQ3pqMkl0Q25keTVtSzk3Njh4YnAtTCIsImlhdCI6MTcwMzc1OTM4OSwiZXhwIjoxNzA1NDg3Mzg5fQ.-VnxxCEjAfASDqx6qiIovwYr_-ZLaUhF4TIUqgGR0aTA83aWhhIGCvrNjZJgoZpg");
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
