import 'package:domain/feature/signup/entities/signup_info.dart';

class SignupInfoModel extends SignupInfo {
  final String name;
  final String otp;
  SignupInfoModel(this.name, this.otp) : super(name: name);

  Map<String, dynamic> toMap() => {
        'otp': otp,
        'signupData': {'name': name}
      };
}
