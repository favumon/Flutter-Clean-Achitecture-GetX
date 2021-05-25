import 'package:domain/feature/login/validation/email_validation.dart';
import 'package:domain/feature/login/validation/password_validation.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:symex_mobile_v2/core/utils/validation_helper.dart';

@injectable
class LoginPageController extends GetxController {
  final emailValidation = EmailValidation();
  final passwordValidation = PasswordValidation();

  LoginPageController() {
    initFormFields();
  }
  late final FormGroup form;

  // get form => fb.group({
  //       'email': generateValidations(emailValidation),
  //       'password': generateValidations(passwordValidation),
  //     });

  Map<String, String> passwordValidationMessages(FormControl<String> control) {
    return generateValidationsMessages('password'.tr, passwordValidation);
  }

  Map<String, String> emailValidationMessages(FormControl<String> controlName) {
    return generateValidationsMessages('email'.tr, emailValidation);
  }

  void initFormFields() {
    form = fb.group({
      'email': generateValidations(emailValidation),
      'password': generateValidations(passwordValidation),
    });
  }
}
