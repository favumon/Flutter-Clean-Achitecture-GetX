import 'package:domain/feature/signup/entities/signup_info.dart';
import 'package:domain/feature/signup/usecases/submit_signup_info.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../app_config/routes/app_routes.dart';
import '../../../core/services/alert_service.dart';
import '../../../core/services/navigation_service.dart';
import '../../otp_verification/pages/otp_verification_page.dart';

@injectable
class SignupPageController extends GetxController {
  final NavigationService _navigationService;
  final SubmitSignupInfo _submitSignupInfo;
  late SignupInfo _signupInfo;
  final AlertService _dialogService;
  SignupPageController(
      this._navigationService, this._submitSignupInfo, this._dialogService);
  void onRegister() {
    _navigationService.navigate(AppRouts.otpVerificationPage,
        arguments: OtpVerificationParams(
            verficationSuccessCallback: onOtpVerify,
            email: 'test@test.com',
            mobileNo: '9865572436'));
  }

  Future<void> onOtpVerify(String otp) async {
    _dialogService.showLoader();

    await Future.delayed(Duration(seconds: 3));
    _signupInfo = SignupInfo(name: 'Test');
    var signupResponse =
        await _submitSignupInfo(SignupRequestParams(_signupInfo, otp));

    signupResponse.fold((l) => null, (r) => null);

    _dialogService.hideLoader();
    _navigationService.navigateAndClearStackUntil(AppRouts.pinRegistrationPage);
  }
}
