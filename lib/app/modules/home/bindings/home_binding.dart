import 'package:get/get.dart';
import 'package:getx_prj_base/app/theme/theme_manager.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
