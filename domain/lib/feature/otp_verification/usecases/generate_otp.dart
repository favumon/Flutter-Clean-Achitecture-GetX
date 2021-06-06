import 'package:core/error/failures.dart';
import 'package:core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/common_api_response.dart';
import 'package:domain/feature/otp_verification/entities/otp_generation_request.dart';
import 'package:domain/feature/otp_verification/repositories/otp_authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GenerateOtp implements UseCase<CommonApiResponse, GenerateOtpParams> {
  final OtpAuthenticationRepository repository;

  GenerateOtp(this.repository);

  @override
  Future<Either<Failure, CommonApiResponse>> call(
      GenerateOtpParams params) async {
    return await repository.generateOtp(
        request: OtpGenerationRequest(
            email: params.email, mobileNo: params.mobileNo));
  }
}

class GenerateOtpParams extends Equatable {
  final String email;
  final String mobileNo;

  GenerateOtpParams({required this.email, required this.mobileNo});
  @override
  List<Object> get props => [];
}
