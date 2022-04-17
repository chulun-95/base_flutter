import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

StreamSubscription? showLoadingTimeout;

void initLoadingStyle() {
  EasyLoading.instance
    // ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.grey.withOpacity(0.7)
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    // ..userInteractions = false
    // ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.opacity
    // ..indicatorWidget = ImageHelper.loadAsset(AssetHelper.imgVPBankSplashLogo, width: 60, height: 40, fit: BoxFit.contain)
    ..customAnimation = CustomAnimation();
}

void showLoading({
  String? status,
  Widget? indicator,
  bool? dismissOnTap,
  EasyLoadingMaskType? maskType = EasyLoadingMaskType.clear,
}) {
  EasyLoading.show(
      status: status,
      // indicator: const SizedBox(width: 50, height: 50),
      dismissOnTap: dismissOnTap,
      maskType: maskType);
}

void hideLoading() {
  // loading.hide();
  if (showLoadingTimeout != null) {
    clearTimeout(showLoadingTimeout!);
    showLoadingTimeout = null;
  }
  // VPLoading().hideLoading();
  if (EasyLoading.isShow) {
    EasyLoading.dismiss();
  }
}

void clearTimeout(StreamSubscription subscription) {
  try {
    subscription.cancel();
  } catch (e) {}
}

StreamSubscription setTimeout(Function callback, int milliseconds) {
  final Future future = Future.delayed(Duration(milliseconds: milliseconds));
  return future.asStream().listen(
    (event) {},
    onDone: () {
      callback();
    },
  );
}

class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}
