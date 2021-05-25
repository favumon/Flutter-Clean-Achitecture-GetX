import 'package:domain/core/validation_params.dart';

class EmailValidation extends ValidationParams {
  @override
  final bool? isRequired = true;
  @override
  final bool? isEmail = true;
}
