import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared_widgets/button_normal.dart';
import '../../../di_injection/injection_container.dart';
import '../controllers/biometric_registration_page_controller.dart';

class BiometricRegistrationPage extends StatelessWidget {
  final BiometricRegistrationPageController controller = Get.put(getIt());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Biometric auth'),
          ButtonNormal(
            buttonText: 'Proceed',
            onTapped: controller.onProceed,
          ),
          ButtonNormal(
            buttonText: 'Skip',
            onTapped: controller.onSkip,
          ),
        ],
      ),
    );
  }
}
