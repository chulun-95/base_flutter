import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_prj_base/app/theme/theme_dark.dart';
import 'package:getx_prj_base/app_config.dart';
import 'package:getx_prj_base/generated/locales.g.dart';

import 'app/routes/app_pages.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);

    AppConfig().configApp();

    runApp(
      ScreenUtilInit(
        designSize: const Size(720, 1080),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? widget) {
          return GetMaterialApp(
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            translationsKeys: AppTranslation.translations,
            fallbackLocale: const Locale('en', 'US'),
            theme: AppThemeDark().getTheme(),
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }, (Object error, StackTrace stackTrace) {});
}
