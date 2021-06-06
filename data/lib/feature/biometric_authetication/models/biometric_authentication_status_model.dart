import 'package:domain/feature/biometric_authetication/entities/biometric_authentication_status.dart';

class BiometricAuthenticationStatusModel extends BiometricAuthenticationStatus {
  final bool isAutheticated;

  BiometricAuthenticationStatusModel(this.isAutheticated)
      : super(isAutheticated);
}
