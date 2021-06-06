import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared_widgets/button_normal.dart';
import '../../../di_injection/injection_container.dart';
import '../controllers/signup_page_controller.dart';

class SignupPage extends StatelessWidget {
  final SignupPageController _controller = Get.put(getIt());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonNormal(
              isFullWidth: true,
              buttonText: 'Register',
              onTapped: _controller.onRegister,
            ),
          )
        ],
      ),
    );
  }
}
