import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:data/core/constants/api_endpoints.dart';
import 'package:data/core/device/biometric_authetication.dart';
import 'package:data/core/device/local_storage.dart';
import 'package:data/core/remote_api.dart';
import 'package:data/feature/app_settings/models/app_settings_model.dart';
import 'package:data/feature/biometric_authetication/models/biometric_authentication_availability_model.dart';
import 'package:data/feature/biometric_authetication/models/biometric_authentication_request_model.dart';
import 'package:data/feature/biometric_authetication/models/biometric_authentication_status_model.dart';
import 'package:data/feature/pin_registration/models/pin_info_model.dart';
import 'package:data/feature/signup/models/signup_info_model.dart';
import 'package:data/feature/signup/models/signup_response_model.dart';
import 'package:domain/feature/biometric_authetication/usecases/check_biometrics_available.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BiometricAutheticationDataSource {
  final BimetricAuthetication bimetricAuthetication;

  BiometricAutheticationDataSource(this.bimetricAuthetication);

  Future<BiometricAuthenticationAvailabilityModel>
      checkBiometricsAvailable() async {
    var available = await bimetricAuthetication.checkBiometricsAvailable();
    return Future.value(BiometricAuthenticationAvailabilityModel(available));
  }

  Future<BiometricAuthenticationStatusModel> authenticateWithBiometrics(
      BiometricAuthenticationRequestModel request) async {
    var isAutheticated = await bimetricAuthetication
        .authenticateWithBiometrics(request.promptMessage);
    return Future.value(BiometricAuthenticationStatusModel(isAutheticated));
  }
}
