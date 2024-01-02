import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:qinglong_tools/routes/routes.dart';

import 'common/theme.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/home',
    theme: lightTheme,
    darkTheme: darkTheme,
    themeMode: ThemeMode.light,
    getPages: routes,
    debugShowCheckedModeBanner: false,
  ));
}
