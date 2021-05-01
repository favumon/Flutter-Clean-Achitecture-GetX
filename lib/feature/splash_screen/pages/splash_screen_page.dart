import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../di_injection/injection_container.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreen extends GetWidget {
  final SplashScreenController splashScreenController =
      getIt<SplashScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('test'.tr),
      ),
    );
  }
}
