import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:data/feature/otp_authentication/data_sources/otp_authentication_data_source.dart';
import 'package:data/feature/otp_authentication/models/otp_generation_request_model.dart';
import 'package:data/feature/otp_authentication/models/otp_verification_request_model.dart';
import 'package:data/feature/signup/data_sources/user_signup_remote_data_source.dart';
import 'package:data/feature/signup/models/signup_info_model.dart';
import 'package:domain/feature/otp_verification/entities/otp_verification_request.dart';
import 'package:domain/feature/otp_verification/entities/otp_generation_request.dart';
import 'package:domain/core/common_api_response.dart';
import 'package:domain/feature/otp_verification/repositories/otp_authentication_repository.dart';
import 'package:domain/feature/signup/entities/signup_info.dart';
import 'package:domain/feature/signup/entities/signup_response.dart';
import 'package:domain/feature/signup/repositories/user_signup_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OtpAuthenticationRepository)
class OtpAuthenticationRepositoryImpl extends OtpAuthenticationRepository {
  final OtpAutheticationDataSource _otpAuthenticationDataSource;

  OtpAuthenticationRepositoryImpl(this._otpAuthenticationDataSource);

  @override
  Future<Either<Failure, CommonApiResponse>> generateOtp(
      {required OtpGenerationRequest request}) async {
    return await _otpAuthenticationDataSource.generateOtp(
        request: OtpGenerationRequestModel(
            email: request.email, mobileNo: request.mobileNo));
  }

  @override
  Future<Either<Failure, CommonApiResponse>> verifyOtp(
      {required OtpVerificationRequest request}) async {
    return await _otpAuthenticationDataSource.verifyOtp(
        request: OtpVerificationRequestModel(request.otp));
  }
}
