import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/shared_widgets/button_normal.dart';
import '../../../di_injection/injection_container.dart';
import '../controllers/pin_entry_page_controller.dart';

class PinEntryPage extends StatelessWidget {
  //final PinEntryPageController _controller = Get.put(getIt());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PinEntryPageController>(
          init: Get.put(getIt()),
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(controller.pageTitle),
                ButtonNormal(
                    buttonText: controller.buttonText,
                    onTapped: controller.onPinSubmit),
                if (controller.isConfirmation)
                  CupertinoButton(
                      child: Text('Back'), onPressed: controller.onBack)
              ],
            );
          }),
    );
  }
}
