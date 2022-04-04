import 'package:flutter/material.dart';
import 'package:getx_prj_base/app/theme/app_color.dart';
import 'package:getx_prj_base/app/theme/textstyles.dart';
import 'package:getx_prj_base/app/theme/theme_dark.dart';
import 'package:getx_prj_base/app/theme/theme_light.dart';

class ThemeManager {
  static final ThemeManager _singleton = ThemeManager._internal();

  factory ThemeManager() {
    return _singleton;
  }

  ThemeManager._internal();

  ThemeMode themeMode = ThemeMode.light;

  void setThemeMode(ThemeMode type) {
    themeMode = type;
  }

  ThemeData getTheme() {
    if (themeMode == ThemeMode.light) {
      return AppThemeLight().getTheme();
    } else {
      return AppThemeDark().getTheme();
    }
  }
}
