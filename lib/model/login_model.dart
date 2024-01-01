import 'package:qinglong_tools/model/base_model.dart';

class LoginModel {
  final String token;
  final String lastip;
  final String lastaddr;
  final int lastlogon;
  final int retries;
  final String platform;

  LoginModel({
    required this.token,
    required this.lastip,
    required this.lastaddr,
    required this.lastlogon,
    required this.retries,
    required this.platform,
  });

  factory LoginModel.fromJson(Map<String, dynamic> item) {
    BaseModel baseModel = BaseModel.fromJson(item);
    Map<String, dynamic> wm = baseModel.data;
    return LoginModel(
      token: wm['token'],
      lastip: wm['lastip'],
      lastaddr: wm['lastaddr'],
      lastlogon: wm['lastlogon'],
      retries: wm['retries'],
      platform: wm['platform'],
    );
  }
}
