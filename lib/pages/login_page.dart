import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qinglong_tools/model/user_model.dart';
import 'package:qinglong_tools/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController username;
  late TextEditingController password;

  @override
  void initState() {
    username = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Theme.of(context).primaryColor,
        //     size: 16,
        //   ),
        // ),
        backgroundColor: Colors.transparent,
        title: Text(
          '登录',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        // actions: [
        //   TextButton(
        //     onPressed: () {
        //       // Navigator.push(
        //       //   context,
        //       //   MaterialPageRoute(
        //       //     builder: (context) => const AddOrWorkPage(),
        //       //   ),
        //       // );
        //     },
        //     icon: Icon(
        //       Icons.add,
        //       color: Theme.of(context).primaryColor,
        //       size: 24,
        //     ),
        //   ),
        // ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            _buildInput('账号', username),
            _buildInput('密码', password, obscureText: true),
            const SizedBox(height: 20),
            Consumer<UserModel>(builder: (context, model, child) {
              if (model.isLogin) {
                FilledButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
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
              if (model.loading) {
                return const CircularProgressIndicator();
              }
              return FilledButton(
                onPressed: () {
                  Provider.of<UserModel>(context, listen: false)
                      .setUser(username.text, password.text);
                  Provider.of<UserModel>(context, listen: false).login();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor)),
                child: const Text(
                  '登录',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }),
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
