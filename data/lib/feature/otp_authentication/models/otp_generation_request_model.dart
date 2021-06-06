import 'package:domain/feature/otp_verification/entities/otp_generation_request.dart';

class OtpGenerationRequestModel extends OtpGenerationRequest {
  final String email;
  final String mobileNo;

  OtpGenerationRequestModel({required this.email, required this.mobileNo})
      : super(email: email, mobileNo: mobileNo);

  Map<String, dynamic> toMap() => {'email': email, 'mobileNo': mobileNo};
}
