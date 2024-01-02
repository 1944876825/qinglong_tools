import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 白天模式
ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: const Color(0xFF008000),
  splashColor: Colors.white12,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    elevation: 0,
    backgroundColor: ThemeData.light().scaffoldBackgroundColor,
    iconTheme: const IconThemeData(color: Colors.black),
  ),
  scaffoldBackgroundColor: ThemeData.light().scaffoldBackgroundColor,
  iconTheme: const IconThemeData(
    color: Colors.red,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.tealAccent,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      .copyWith(background: const Color(0xFFF5F7F9)),
);

// 夜间模式
ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.white,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    elevation: 0,
    backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
  iconTheme: const IconThemeData(
    color: Colors.blue,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.tealAccent, unselectedItemColor: Colors.blue),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      .copyWith(background: Colors.black),
);
