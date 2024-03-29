import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../db/cache/cache.dart';
import '../../http/core/http.dart';
import '../../widget/fun_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Cache.preInit().then((value) {
      _init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.home,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
        ),
        title: Text(
          '青龙APP',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
            },
            icon: Icon(
              Icons.light_mode,
              color: Theme.of(context).primaryColor,
              size: 24,
            ),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 1 / 1.1,
        children: const [
          FunCard(
            funIcon: Icons.timer,
            funText: '定时任务',
          ),
        ],
      ),
    );
  }

  void _init(BuildContext context) {
    try {
      List<String>? userModel = Cache.getInstance().getStringList('UserModel');
      if (userModel != null &&
          userModel.isNotEmpty &&
          userModel[2].isNotEmpty) {
        Http.getInstance().setToken(userModel[2]);
      } else {
        Get.offAllNamed('/login');
      }
    } catch (e) {
      debugPrint('_init error: $e');
    }
  }
}
