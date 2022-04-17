import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_prj_base/app/theme/theme_manager.dart';
import 'package:getx_prj_base/app/utils/widget_utils/app_scaffold.dart';
import '../../../theme/textstyles.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  ThemeManager().setThemeMode(ThemeMode.dark);
                  Get.changeTheme(ThemeManager().getTheme());
                  // showDialog();
                  // showSnackBar();
                },
                child: const Text(
                  'Dark',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  ThemeManager().setThemeMode(ThemeMode.light);
                  Get.changeTheme(ThemeManager().getTheme());
                },
                child: Text(
                  'Light',
                  style: TextStyles.headerText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
