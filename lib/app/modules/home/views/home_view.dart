import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_prj_base/app/theme/theme_manager.dart';
import '../../../theme/textstyles.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('HomeView rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // ThemeManager().setThemeMode(ThemeMode.dark);
                  // Get.changeTheme(ThemeManager().getTheme());
                  // showDialog();
                  showSnackBar();
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

  void showDialog() {
    Get.dialog(
        Center(
          child: Container(
            width: 200,
            height: 100,
            color: Colors.blue,
          ),
        ),
        barrierDismissible: true);
  }

  void showSnackBar() {
    Get.showSnackbar(const GetSnackBar(
      message: 'hihihihihihihi',
      margin: EdgeInsets.all(16),
      isDismissible: true,
      duration: Duration(milliseconds: 1000),
      borderRadius: 10,
      snackPosition: SnackPosition.BOTTOM,
    ));
  }
}
