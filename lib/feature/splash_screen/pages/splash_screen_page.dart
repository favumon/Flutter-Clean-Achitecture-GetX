import 'package:flutter/material.dart';
import 'package:symex_mobile_v2/feature/splash_screen/controllers/splash_screen_controller.dart';
import 'package:symex_mobile_v2/injection_container.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenController splashScreenController =
      getIt<SplashScreenController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Splash screen'),
    );
  }
}
