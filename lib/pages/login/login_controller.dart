import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../db/cache/cache.dart';
import '../../http/core/http.dart';
import '../../http/request/user_request.dart';
import '../../model/base_model.dart';
import '../../model/login_model.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isLogin = false.obs;
  RxBool loading = false.obs;
  RxString token = ''.obs;

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

  @override
  void onInit() {
    super.onInit();
    List<String>? userModel = Cache.getInstance().getStringList('UserModel');
    if (userModel != null && userModel.isNotEmpty) {
      username.text = userModel[0];
      password.text = userModel[1];
    }
  }

  void login() async {
    setLoading(true);
    UserLogin userLogin = UserLogin();
    userLogin
        .addData('username', username.text)
        .addData('password', password.text);
    var value = await Http.getInstance().fire(userLogin);
    BaseModel baseModel = BaseModel.fromJson(value);
    if (baseModel.code == 200) {
      LoginModel res = LoginModel.fromJson(value);
      setToken(res.token);
      Http.getInstance().setToken(res.token);
      Cache.getInstance().setStringList(
          'UserModel', [username.text, password.text, res.token]);
      debugPrint('token ${res.token}');
      setLogin(true);

      Get.offAllNamed('home');
    } else {
      debugPrint(baseModel.message);
    }
    setLoading(false);
  }
}
