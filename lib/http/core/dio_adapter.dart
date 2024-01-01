import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:qinglong_tools/http/core/http_error.dart';

import '../request/base_request.dart';
import 'http_adapter.dart';

// Dio适配器
class DioAdapter extends HttpAdapter {
  @override
  Future<HttpResponse<T>> send<T>(BaseRequest request) async {
    var response, options = Options(headers: request.header);
    DioException? error;
    try {
      if (request.httpMethod() == HttpMethod.get) {
        response = await Dio().get(request.url(), options: options);
      } else if (request.httpMethod() == HttpMethod.post) {
        response = await Dio()
            .post(request.url(), data: request.data(), options: options);
      } else if (request.httpMethod() == HttpMethod.delete) {
        response = await Dio()
            .delete(request.url(), data: request.data(), options: options);
      } else if (request.httpMethod() == HttpMethod.put) {
        response = await Dio()
            .put(request.url(), data: request.data(), options: options);
      }
    } on DioException catch (e) {
      debugPrint('[dio error] $e');
      error = e;
      response = e.response;
      debugPrint(e.response?.statusCode.toString());
    }
    if (error != null) {
      throw HttpError(response?.statusCode ?? -1, error.toString(),
          data: buildRes(response, request));
    }
    return buildRes(response, request) as HttpResponse<T>;
  }

  HttpResponse buildRes(response, BaseRequest request) {
    return HttpResponse(
      data: response.data,
      request: request,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response,
    );
  }
}
