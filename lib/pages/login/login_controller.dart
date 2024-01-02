import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../db/cache.dart';
import '../../http/core/http.dart';
import '../../http/request/user_request.dart';
import '../../model/base_model.dart';
import '../../model/login_model.dart';

class LoginController extends GetxController {
  // 声明一个RxString类型的变量用于存储用户名
  RxString username = ''.obs;

  // 声明一个RxString类型的变量用于存储密码
  RxString password = ''.obs;

  RxBool isLogin = false.obs;

  RxBool loading = false.obs;

  RxString token = ''.obs;

  // 定义一个方法用于更新用户名
  void setUser(String username, String password) {
    this.username.value = username;
    this.password.value = password;
  }

  void setLoading(bool value) {
    loading.value = value;
    refresh();
  }

  void setToken(String value) {
    token.value = value;
  }

  void setLogin(bool value) {
    isLogin.value = value;
    refresh();
  }

  void login() async {
    setLoading(true);
    UserLogin userLogin = UserLogin();
    userLogin
        .addData('username', username.value)
        .addData('password', password.value);
    var value = await Http.getInstance().fire(userLogin);
    BaseModel baseModel = BaseModel.fromJson(value);
    if (baseModel.code == 200) {
      LoginModel res = LoginModel.fromJson(value);
      setToken(res.token);
      Http.getInstance().setToken(res.token);
      Cache.getInstance().setStringList(
          'UserModel', [username.value, password.value, res.token]);
      debugPrint('token ${res.token}');
      setLogin(true);
      Get.toNamed('home');
    } else {
      debugPrint(baseModel.message);
    }
    setLoading(false);
  }
}
