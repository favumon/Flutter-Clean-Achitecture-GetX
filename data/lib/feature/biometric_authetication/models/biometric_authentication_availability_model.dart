import 'package:domain/feature/biometric_authetication/entities/biometric_authentication_availability.dart';

class BiometricAuthenticationAvailabilityModel
    extends BiometricAuthenticationAvailability {
  final bool isBiometricAvailable;

  BiometricAuthenticationAvailabilityModel(this.isBiometricAvailable)
      : super(isBiometricAvailable);
}
