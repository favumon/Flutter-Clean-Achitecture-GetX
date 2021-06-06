import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared_widgets/button_normal.dart';
import '../../../di_injection/injection_container.dart';
import '../controllers/otp_verification_page_controller.dart';

class OtpVerificationParams {
  final void Function(String otp) verficationSuccessCallback;
  final String email;
  final String mobileNo;

  OtpVerificationParams(
      {required this.verficationSuccessCallback,
      required this.email,
      required this.mobileNo});
}

class OtpVerificationPage extends StatelessWidget {
  final void Function(String otp) verficationSuccessCallback;

  final OtpVerificationPageController _controller = Get.put(getIt());

  OtpVerificationPage(
      {required final OtpVerificationParams otpVerificationParams})
      : this.verficationSuccessCallback =
            otpVerificationParams.verficationSuccessCallback;
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
              buttonText: 'Verify',
              onTapped: _controller.onVerify,
            ),
          )
        ],
      ),
    );
  }
}
