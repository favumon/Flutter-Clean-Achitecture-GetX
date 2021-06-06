import 'dart:math';

import 'package:equatable/equatable.dart';

class OtpGenerationRequest extends Equatable {
  final String email;
  final String mobileNo;

  OtpGenerationRequest({required this.email, required this.mobileNo});

  @override
  List<Object?> get props => [email, mobileNo];
}
