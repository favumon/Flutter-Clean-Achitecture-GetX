import 'package:domain/feature/app_settings/entities/app_settings.dart';
import 'package:domain/feature/signup/entities/signup_response.dart';

class SignupResponseModel extends SignupResponse {
  SignupResponseModel();

  factory SignupResponseModel.fromMap(Map<String, dynamic> json) =>
      SignupResponseModel();

  Map<String, dynamic> toMap() => {};
}
