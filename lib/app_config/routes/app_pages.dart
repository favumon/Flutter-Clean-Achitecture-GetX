import 'package:get/get.dart';

import '../../feature/biometric_registration/pages/biometric_registration_page.dart';
import '../../feature/biometric_registration/pages/biometric_registration_success_page.dart';
import '../../feature/language_selection/pages/language_selection_page.dart';
import '../../feature/login/pages/login_page.dart';
import '../../feature/otp_verification/pages/otp_verification_page.dart';
import '../../feature/pin_registration/pages/pin_entry_pages.dart';
import '../../feature/signup/pages/signup_page.dart';
import '../../feature/splash_screen/pages/splash_screen_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRouts.initial,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRouts.languageSelectionPage,
      page: () => LanguageSelectionPage(),
    ),
    GetPage(
      name: AppRouts.loginPage,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRouts.signupPage,
      page: () => SignupPage(),
    ),
    GetPage(
      name: AppRouts.otpVerificationPage,
      page: () => OtpVerificationPage(
        otpVerificationParams: Get.arguments,
      ),
    ),
    GetPage(
      name: AppRouts.pinRegistrationPage,
      page: () => PinEntryPage(),
    ),
    GetPage(
      name: AppRouts.biometricRegistraionPage,
      page: () => BiometricRegistrationPage(),
    ),
    GetPage(
      name: AppRouts.biometricRegistraionSuccessPage,
      page: () => BiometricRegistrationSuccessPage(),
    ),
  ];
}
