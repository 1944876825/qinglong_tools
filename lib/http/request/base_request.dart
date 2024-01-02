import 'package:flutter/cupertino.dart';

import '../../common/config.dart';

enum HttpMethod { get, post, delete, put }

abstract class BaseRequest {
  var pathParams = '';
  var useHttps = false;

  String baseUrl() {
    return apiUrl;
  }

  HttpMethod httpMethod();
  String path();
  String url() {
    Uri uri;
    var pathStr = path();
    if (pathParams.isNotEmpty) {
      if (path().endsWith(("/"))) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }
    if (useHttps) {
      uri = Uri.https(baseUrl(), pathStr, params);
    } else {
      uri = Uri.http(baseUrl(), pathStr, params);
    }
    debugPrint("url $uri");
    return uri.toString();
  }

  bool needLogin();
  Map<String, String> params = {};

  Object? data() => dataMap.isNotEmpty ? dataMap : dataStr;
  String dataStr = '';
  Map<String, dynamic> dataMap = {};
  // 添加参数
  BaseRequest addData(String k, Object v) {
    dataMap[k] = v;
    return this;
  }

  BaseRequest setData(String data) {
    dataStr = data;
    return this;
  }

  // 添加参数
  BaseRequest addParams(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  Map<String, dynamic> header = {};
  // 添加Header
  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }
}
