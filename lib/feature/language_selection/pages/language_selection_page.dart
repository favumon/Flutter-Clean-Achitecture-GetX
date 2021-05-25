import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symex_mobile_v2/di_injection/injection_container.dart';
import 'package:symex_mobile_v2/feature/language_selection/controllers/language_selection_page_controller.dart';

class LanguageSelectionPage extends StatelessWidget {
  final LanguageSelectionPageController _controller =
      Get.put(getIt<LanguageSelectionPageController>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Language selection'),
            TextButton(
                onPressed: () => _controller.onLanguageSelected(''),
                child: Text('Set Language'))
          ],
        ),
      ),
    );
  }
}
