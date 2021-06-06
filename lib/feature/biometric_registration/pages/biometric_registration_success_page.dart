import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared_widgets/button_normal.dart';
import '../../../di_injection/injection_container.dart';
import '../controllers/biometric_registration_success_page_controller.dart';

class BiometricRegistrationSuccessPage extends StatelessWidget {
  final BiometricRegistrationSuccessPageController controller =
      Get.put(getIt());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonNormal(
            buttonText: 'Get started',
            onTapped: controller.onGetStarted,
          ),
        ],
      ),
    );
  }
}
