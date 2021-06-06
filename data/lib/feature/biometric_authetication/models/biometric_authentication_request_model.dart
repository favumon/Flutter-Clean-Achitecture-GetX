import 'package:domain/feature/biometric_authetication/entities/biometric_authentication_request.dart';

class BiometricAuthenticationRequestModel
    extends BiometricAuthenticationRequest {
  final String promptMessage;

  BiometricAuthenticationRequestModel(this.promptMessage)
      : super(promptMessage);
}
