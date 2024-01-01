import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qinglong_tools/model/theme_model.dart';
import 'package:qinglong_tools/pages/home_page.dart';

import 'model/provider_setup.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeModel>(context).themeData,
      home: const Scaffold(
        body: HomePage(),
      ),
    );
  }
}