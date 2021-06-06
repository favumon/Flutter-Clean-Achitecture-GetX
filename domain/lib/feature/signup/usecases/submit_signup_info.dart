import 'package:core/error/failures.dart';
import 'package:core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/feature/signup/entities/signup_info.dart';
import 'package:domain/feature/signup/entities/signup_response.dart';
import 'package:domain/feature/signup/repositories/user_signup_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SubmitSignupInfo implements UseCase<SignupResponse, SignupRequestParams> {
  final UserSignupRepository repository;

  SubmitSignupInfo(this.repository);

  @override
  Future<Either<Failure, SignupResponse>> call(
      SignupRequestParams params) async {
    return await repository.submitSignupInfo(
        signupInfo: params.signupInfo, otp: params.otp);
  }
}

class SignupRequestParams extends Equatable {
  final SignupInfo signupInfo;
  final String otp;

  SignupRequestParams(this.signupInfo, this.otp);
  @override
  List<Object> get props => [];
}
