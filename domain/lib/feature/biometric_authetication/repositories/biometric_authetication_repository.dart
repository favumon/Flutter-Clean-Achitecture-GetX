import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/feature/biometric_authetication/entities/biometric_authentication_availability.dart';
import 'package:domain/feature/biometric_authetication/entities/biometric_authentication_request.dart';
import 'package:domain/feature/biometric_authetication/entities/biometric_authentication_status.dart';
import 'package:domain/feature/pin_registration/entities/pin_info.dart';

abstract class BiometricAutheticationRepository {
  Future<Either<Failure, BiometricAuthenticationStatus>>
      autheticateWithBiometrics(BiometricAuthenticationRequest request);
  Future<Either<Failure, BiometricAuthenticationAvailability>>
      checkBiometricAvailable();
}
