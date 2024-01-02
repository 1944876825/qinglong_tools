import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qinglong_tools/pages/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          '登录',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            _buildInput('账号', loginController.username),
            _buildInput('密码', loginController.password, obscureText: true),
            const SizedBox(height: 20),
            GetBuilder<LoginController>(
              builder: (loginController) {
                if (loginController.isLogin.value) {
                  return FilledButton(
                    onPressed: () {
                      Get.offAllNamed('/home');
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    child: const Text(
                      '进入',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                if (loginController.loading.value) {
                  return CircularProgressIndicator(
                      color: Theme.of(context).primaryColor);
                }
                return FilledButton(
                  onPressed: () {
                    loginController.login();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor)),
                  child: const Text(
                    '登录',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(String title, TextEditingController controller,
      {bool obscureText = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: Colors.white,
          ),
          child: TextField(
            obscureText: obscureText,
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
