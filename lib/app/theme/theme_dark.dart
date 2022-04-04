import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_prj_base/app/theme/textstyles.dart';

class AppThemeDark {
  static Color primaryColor = Colors.black.withOpacity(0.8);

  AppBarTheme appBarTheme = AppBarTheme(
    centerTitle: false,
    elevation: 0,
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent),
    color: primaryColor,
    // brightness: Brightness.light,
    // systemOverlayStyle: SystemUiOverlayStyle.dark, // 2
  );

  ThemeData getTheme() {
    return ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black12,
    );
  }
}
