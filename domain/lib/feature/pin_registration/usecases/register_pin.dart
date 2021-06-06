import 'package:core/error/failures.dart';
import 'package:core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/common_api_response.dart';
import 'package:domain/feature/otp_verification/entities/otp_generation_request.dart';
import 'package:domain/feature/otp_verification/repositories/otp_authentication_repository.dart';
import 'package:domain/feature/pin_registration/entities/pin_info.dart';
import 'package:domain/feature/pin_registration/repositories/pin_register_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterPin implements UseCase<void, RegisterPinParams> {
  final PinRegisterRepository repository;

  RegisterPin(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterPinParams params) async {
    return await repository.registerPin(PinInfo(params.pin));
  }
}

class RegisterPinParams extends Equatable {
  final String pin;

  RegisterPinParams({required this.pin});
  @override
  List<Object> get props => [];
}
