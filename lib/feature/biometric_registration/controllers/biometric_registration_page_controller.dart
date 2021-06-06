import 'package:domain/feature/biometric_authetication/usecases/autheticate_with_biometrics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import '../../../app_config/routes/app_pages.dart';
import '../../../app_config/routes/app_routes.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/shared_widgets/button_normal.dart';

@injectable
class BiometricRegistrationPageController extends GetxController {
  final AutheticateWithBiometrics autheticateWithBiometrics;
  final NavigationService navigationService;

  BiometricRegistrationPageController(
      this.autheticateWithBiometrics, this.navigationService);

  Future<void> onProceed() async {
    var autheticated = await autheticateWithBiometrics(
        AutheticateWithBiometricsParams('Prompt Reason'));

    autheticated.fold(
        (l) => null,
        (r) => navigationService
            .navigate(AppRouts.biometricRegistraionSuccessPage));
  }

  void onSkip() {
    navigationService.navigateBackUntil(AppRouts.loginPage);
  }
}
