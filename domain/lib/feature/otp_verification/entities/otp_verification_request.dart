import 'package:equatable/equatable.dart';

class OtpVerificationRequest extends Equatable {
  final String otp;

  OtpVerificationRequest(this.otp);

  @override
  List<Object?> get props => [otp];
}
