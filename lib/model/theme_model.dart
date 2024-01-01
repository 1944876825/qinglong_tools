import 'package:flutter/material.dart';

class ThemeModel with ChangeNotifier {
  late ThemeData themeData;
  late ThemeType currentType;

  ThemeModel(ThemeType type) {
    _update(type);
    // currentType = type;
    // if (type == ThemeType.dark) {
    //   themeData = ThemeData.dark();
    // } else {
    //   // ThemeData.light()
    //   themeData = ThemeData(
    //     primaryColor: const Color(0xFF008000),
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
    //         .copyWith(background: const Color(0xFFF5F7F9)),
    //     useMaterial3: true,
    //   );
    // }
  }

  void reverse() {
    if (currentType == ThemeType.light) {
      _update(ThemeType.dark);
    } else {
      _update(ThemeType.light);
    }
  }

  void _update(ThemeType type) {
    currentType = type;
    if (type == ThemeType.dark) {
      themeData = ThemeData.dark();
    } else {
      themeData = ThemeData(
        primaryColor: const Color(0xFF008000),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(background: const Color(0xFFF5F7F9)),
        useMaterial3: true,
      );
    }
    notifyListeners();
  }
}

enum ThemeType {
  dark,
  light,
}
