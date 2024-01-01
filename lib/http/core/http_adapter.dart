import 'dart:convert';

import '../request/base_request.dart';

// 网络请求抽象类
abstract class HttpAdapter {
  Future<HttpResponse<T>> send<T>(BaseRequest request);
}

// 统一网络层返回格式
class HttpResponse<T> {
  HttpResponse({
    this.data,
    this.request,
    this.statusCode,
    this.statusMessage,
    this.extra,
  });
  T? data;
  BaseRequest? request;
  int? statusCode;
  String? statusMessage;
  dynamic? extra;

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
