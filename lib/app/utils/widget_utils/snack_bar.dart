import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

showSnackBar(String message) {
  Get.showSnackbar(
    GetSnackBar(
      message: message,
      margin: const EdgeInsets.all(16),
      isDismissible: true,
      duration: const Duration(seconds: 2),
      borderRadius: 10,
      snackPosition: SnackPosition.BOTTOM,
    ),
  );
}
