import 'package:core/usecases/usecase.dart';
import 'package:domain/feature/biometric_authetication/usecases/autheticate_with_biometrics.dart';
import 'package:domain/feature/biometric_authetication/usecases/check_biometrics_available.dart';
import 'package:domain/feature/pin_registration/usecases/register_pin.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../app_config/routes/app_routes.dart';
import '../../../core/services/navigation_service.dart';

enum PinEntryMode { registration, confirmation }

@injectable
class PinEntryPageController extends GetxController {
  final RegisterPin registerPin;
  final CheckBiometricsAvailable checkBiometricsAvailable;
  final AutheticateWithBiometrics autheticateWithBiometrics;
  final NavigationService navigationService;
  PinEntryPageController(this.registerPin, this.navigationService,
      this.checkBiometricsAvailable, this.autheticateWithBiometrics);
  PinEntryMode _pinEntryMode = PinEntryMode.registration;
  late String pin;

  String get pageTitle => _pinEntryMode == PinEntryMode.registration
      ? 'Register PIN'
      : 'Confirm PIN';
  String get buttonText =>
      _pinEntryMode == PinEntryMode.registration ? 'Register' : 'Confirm';

  get isConfirmation => _pinEntryMode == PinEntryMode.confirmation;

  Future<void> onPinSubmit() async {
    if (_pinEntryMode == PinEntryMode.confirmation) {
      pin = '1234';
      registerPin(RegisterPinParams(pin: pin));

      (await checkBiometricsAvailable(NoParams())).fold((l) => null, (r) async {
        navigationService.navigateAndReplace(AppRouts.biometricRegistraionPage);
      });
    } else
      _pinEntryMode = PinEntryMode.confirmation;

    update();
  }

  void onBack() {
    _pinEntryMode = PinEntryMode.registration;
    update();
  }
}
