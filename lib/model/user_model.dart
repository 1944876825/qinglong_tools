import 'package:flutter/cupertino.dart';
import 'package:qinglong_tools/db/cache/cache.dart';

import '../http/core/http.dart';
import '../http/request/user_request.dart';
import 'base_model.dart';
import 'login_model.dart';

class UserModel with ChangeNotifier {
  String username;
  String password;
  bool isLogin = false;
  String token = '';
  bool loading = false;

  UserModel({this.username = '', this.password = ''});

  void setUser(String username, String password) {
    this.username = username;
    this.password = password;
  }

  void setToken(String token) {
    this.token = token;
    notifyListeners();
  }

  void setLogin(bool login) {
    isLogin = login;
    notifyListeners();
  }

  void setLoading(bool loading) {
    this.loading = loading;
    notifyListeners();
  }

  void login() async {
    setLoading(true);
    UserLogin userLogin = UserLogin();
    userLogin.addData('username', username).addData('password', password);
    var value = await Http.getInstance().fire(userLogin);
    BaseModel baseModel = BaseModel.fromJson(value);
    if (baseModel.code == 200) {
      LoginModel res = LoginModel.fromJson(value);
      setToken(res.token);
      Http.getInstance().setToken(res.token);
      Cache.getInstance()
          .setStringList('UserModel', [username, password, res.token]);
      setLogin(true);
    } else {
      debugPrint(baseModel.message);
    }
    setLoading(false);
  }
}
