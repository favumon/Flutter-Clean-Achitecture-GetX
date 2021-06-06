import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../app_config/routes/app_routes.dart';
import '../../../core/shared_widgets/button_outlined.dart';
import '../../../core/shared_widgets/common_text_field.dart';
import '../../../di_injection/injection_container.dart';
import '../controllers/login_page_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginPageController _loginPageController =
      Get.put<LoginPageController>(getIt());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  title: const Text('Complex sample'),
      appBar: AppBar(
        title: Text('Sample'),
      ),
      body: ReactiveFormBuilder(
        form: () => _loginPageController.form,
        builder: (context, form, child) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextField(
                    controlName: 'email',
                    validationMessages:
                        _loginPageController.emailValidationMessages,
                    onSubmitted: () => form.focus('password'),
                    placeHolderText: 'email'.tr,
                  ),
                  const SizedBox(height: 24.0),
                  CommonTextField(
                    controlName: 'password',
                    validationMessages:
                        _loginPageController.passwordValidationMessages,
                    placeHolderText: 'password'.tr,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 24.0),
                  ReactiveFormConsumer(
                    builder: (context, form, child) => ElevatedButton(
                      onPressed: form.valid ? () => print(form.value) : null,
                      child: const Text('Login'),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonOutlined(
                      buttonText: 'Signup',
                      onTapped: () => Get.toNamed(AppRouts.signupPage),
                    ),
                  ),
                  Text(
                    'Email Password',
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          subtitle: Text('Subtitle'),
                          title: Text('Subtitle'),
                        )
                      ],
                    ),
                  )
                  // Checkbox(value: true, onChanged: (_) {}),
                  // FloatingActionButton(
                  //     child: Icon(Icons.add), onPressed: () {}),
                  // TextFormField(),
                  // IconButton(
                  //     onPressed: () {}, icon: Icon(Icons.ac_unit_rounded)),
                  // SwitchListTile(value: true, onChanged: (_) {})
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
