// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:domain/feature/api_error_handler/usecases/get_api_error_stream.dart'
    as _i27;
import 'package:domain/feature/app_settings/entities/app_settings.dart' as _i20;
import 'package:domain/feature/app_settings/usecases/get_app_settings.dart'
    as _i29;
import 'package:domain/feature/biometric_authetication/usecases/autheticate_with_biometrics.dart'
    as _i12;
import 'package:domain/feature/biometric_authetication/usecases/check_biometrics_available.dart'
    as _i11;
import 'package:domain/feature/local_storage/usecases/get_default_language.dart'
    as _i14;
import 'package:domain/feature/local_storage/usecases/set_default_language.dart'
    as _i19;
import 'package:domain/feature/otp_verification/usecases/generate_otp.dart'
    as _i22;
import 'package:domain/feature/otp_verification/usecases/verify_otp.dart'
    as _i23;
import 'package:domain/feature/pin_registration/usecases/register_pin.dart'
    as _i10;
import 'package:domain/feature/signup/usecases/submit_signup_info.dart' as _i25;
import 'package:get/get.dart' as _i8;
import 'package:get/instance_manager.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app_config/theme/theme.dart' as _i3;
import '../app_config/theme/theme_nec.dart' as _i4;
import '../core/services/alert_service.dart' as _i15;
import '../core/services/api_error_handler_service.dart' as _i26;
import '../core/services/app_settings_service.dart' as _i28;
import '../core/services/navigation_service.dart' as _i7;
import '../feature/biometric_registration/controllers/biometric_registration_page_controller.dart'
    as _i16;
import '../feature/biometric_registration/controllers/biometric_registration_success_page_controller.dart'
    as _i17;
import '../feature/language_selection/controllers/language_selection_page_controller.dart'
    as _i18;
import '../feature/login/controllers/login_page_controller.dart' as _i6;
import '../feature/otp_verification/controllers/otp_verification_page_controller.dart'
    as _i21;
import '../feature/pin_registration/controllers/pin_entry_page_controller.dart'
    as _i9;
import '../feature/signup/controllers/signup_page_controller.dart' as _i24;
import '../feature/splash_screen/controllers/splash_screen_controller.dart'
    as _i13;
import 'register_module.dart' as _i30;

const String _developmentNec = 'developmentNec';
const String _productionNec = 'productionNec';
const String _development = 'development';
const String _production = 'production';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Apptheme>(() => _i4.AppThemeNecImpl(),
      registerFor: {_developmentNec, _productionNec});
  gh.factory<_i3.Apptheme>(() => _i3.AppThemeImpl(),
      registerFor: {_development, _production});
  gh.lazySingleton<_i5.GetInterface>(() => registerModule.gets());
  gh.lazySingleton<_i1.GetIt>(() => registerModule.getit());
  gh.factory<_i6.LoginPageController>(() => _i6.LoginPageController());
  gh.lazySingleton<_i7.NavigationService>(
      () => _i7.NavigationService(get<_i8.GetInterface>()));
  gh.factory<_i9.PinEntryPageController>(() => _i9.PinEntryPageController(
      get<_i10.RegisterPin>(),
      get<_i7.NavigationService>(),
      get<_i11.CheckBiometricsAvailable>(),
      get<_i12.AutheticateWithBiometrics>()));
  gh.factory<_i13.SplashScreenController>(() => _i13.SplashScreenController(
      get<_i1.GetIt>(),
      get<_i14.GetDefaultLanguage>(),
      get<_i7.NavigationService>()));
  gh.lazySingleton<_i15.AlertService>(() =>
      _i15.AlertService(get<_i8.GetInterface>(), get<_i7.NavigationService>()));
  gh.factory<_i16.BiometricRegistrationPageController>(() =>
      _i16.BiometricRegistrationPageController(
          get<_i12.AutheticateWithBiometrics>(), get<_i7.NavigationService>()));
  gh.factory<_i17.BiometricRegistrationSuccessPageController>(() =>
      _i17.BiometricRegistrationSuccessPageController(
          get<_i7.NavigationService>()));
  gh.factory<_i18.LanguageSelectionPageController>(() =>
      _i18.LanguageSelectionPageController(get<_i19.SetDefaultLanguage>(),
          get<_i7.NavigationService>(), get<_i20.AppSettings>()));
  gh.factory<_i21.OtpVerificationPageController>(() =>
      _i21.OtpVerificationPageController(
          get<_i8.GetInterface>(),
          get<_i22.GenerateOtp>(),
          get<_i23.VerifyOtp>(),
          get<_i15.AlertService>()));
  gh.factory<_i24.SignupPageController>(() => _i24.SignupPageController(
      get<_i7.NavigationService>(),
      get<_i25.SubmitSignupInfo>(),
      get<_i15.AlertService>()));
  gh.singleton<_i26.ApiErrorHandlerService>(
      _i26.ApiErrorHandlerServiceImpl(
          get<_i15.AlertService>(), get<_i27.GetApiErrorStream>()),
      dispose: (i) => i.onDispose());
  gh.singleton<_i28.AppSettingsService>(
      _i28.AppSettingsService(get<_i29.GetAppSettings>(), get<_i1.GetIt>()),
      signalsReady: true);
  return get;
}

class _$RegisterModule extends _i30.RegisterModule {}
