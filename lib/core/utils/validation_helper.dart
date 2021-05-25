import 'package:domain/core/validation_params.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

Map<String, String> generateValidationsMessages(
    String fielsName, ValidationParams validationParams) {
  return {
    if (validationParams.isRequired != null && validationParams.isRequired!)
      ValidationMessage.required:
          'field_not_empty_validation'.trParams({'field': fielsName})!,
    if (validationParams.isEmail != null && validationParams.isEmail!)
      ValidationMessage.email:
          'field_must_valid_validation'.trParams({'field': fielsName})!,
  };
}

generateValidations(ValidationParams validationParams) {
  return [
    '', //should initialize the control with a default
    if (validationParams.isRequired != null && validationParams.isRequired!)
      Validators.required,
    if (validationParams.isEmail != null && validationParams.isEmail!)
      Validators.email
  ];
}
