import 'package:core/error/failures.dart';
import 'package:core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/common_api_response.dart';
import 'package:domain/feature/biometric_authetication/entities/biometric_authentication_availability.dart';
import 'package:domain/feature/biometric_authetication/repositories/biometric_authetication_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CheckBiometricsAvailable
    implements UseCase<BiometricAuthenticationAvailability, NoParams> {
  final BiometricAutheticationRepository repository;

  CheckBiometricsAvailable(this.repository);

  @override
  Future<Either<Failure, BiometricAuthenticationAvailability>> call(
      NoParams params) async {
    return await repository.checkBiometricAvailable();
  }
}
