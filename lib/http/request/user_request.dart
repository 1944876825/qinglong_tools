import 'package:qinglong_tools/http/request/base_request.dart';

// 用户登录
class UserLogin extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.post;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return '/api/user/login';
  }
}
