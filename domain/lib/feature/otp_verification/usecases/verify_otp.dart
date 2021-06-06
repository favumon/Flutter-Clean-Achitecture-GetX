import 'package:core/error/failures.dart';
import 'package:core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/common_api_response.dart';
import 'package:domain/feature/otp_verification/entities/otp_generation_request.dart';
import 'package:domain/feature/otp_verification/entities/otp_verification_request.dart';
import 'package:domain/feature/otp_verification/repositories/otp_authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class VerifyOtp implements UseCase<CommonApiResponse, VerifyOtpParams> {
  final OtpAuthenticationRepository repository;

  VerifyOtp(this.repository);

  @override
  Future<Either<Failure, CommonApiResponse>> call(
      VerifyOtpParams params) async {
    return await repository.verifyOtp(
        request: OtpVerificationRequest(params.otp));
  }
}

class VerifyOtpParams extends Equatable {
  final String otp;

  VerifyOtpParams(this.otp);
  @override
  List<Object> get props => [];
}
