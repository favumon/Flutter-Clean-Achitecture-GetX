import 'package:domain/feature/otp_verification/entities/otp_verification_request.dart';

class OtpVerificationRequestModel extends OtpVerificationRequest {
  final String otp;

  OtpVerificationRequestModel(this.otp) : super(otp);

  Map<String, dynamic> toMap() => {
        'otp': otp,
        'signupData': {'otp': otp}
      };
}
