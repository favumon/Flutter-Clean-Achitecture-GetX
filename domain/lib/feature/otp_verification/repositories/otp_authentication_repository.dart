import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/common_api_response.dart';
import 'package:domain/feature/otp_verification/entities/otp_generation_request.dart';
import 'package:domain/feature/otp_verification/entities/otp_verification_request.dart';

abstract class OtpAuthenticationRepository {
  Future<Either<Failure, CommonApiResponse>> generateOtp(
      {required OtpGenerationRequest request});
  Future<Either<Failure, CommonApiResponse>> verifyOtp(
      {required OtpVerificationRequest request});
}
