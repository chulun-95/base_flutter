import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_prj_base/app/theme/textstyles.dart';

class AppThemeLight {
  static const Color primaryColor = Colors.white;

  AppBarTheme appBarTheme =  const AppBarTheme(
    centerTitle: false,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent),
    color: primaryColor,
    // brightness: Brightness.light,
    // systemOverlayStyle: SystemUiOverlayStyle.dark, // 2
  );

  ThemeData getTheme() {
    return ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: Colors.white54,
    );
  }
}
