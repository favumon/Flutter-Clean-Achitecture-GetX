// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../feature/api_error_handler/repositories/api_error_handler_repository.dart'
    as _i9;
import '../feature/api_error_handler/usecases/get_api_error_stream.dart' as _i8;
import '../feature/app_settings/repositories/app_settings_repository.dart'
    as _i11;
import '../feature/app_settings/usecases/get_app_settings.dart' as _i10;
import '../feature/biometric_authetication/repositories/biometric_authetication_repository.dart'
    as _i4;
import '../feature/biometric_authetication/usecases/autheticate_with_biometrics.dart'
    as _i3;
import '../feature/biometric_authetication/usecases/check_biometrics_available.dart'
    as _i5;
import '../feature/local_storage/repositories/local_storage_repository.dart'
    as _i14;
import '../feature/local_storage/usecases/get_default_language.dart' as _i13;
import '../feature/local_storage/usecases/set_default_language.dart' as _i17;
import '../feature/login/usecases/get_app_settings.dart' as _i12;
import '../feature/otp_verification/repositories/otp_authentication_repository.dart'
    as _i7;
import '../feature/otp_verification/usecases/generate_otp.dart' as _i6;
import '../feature/otp_verification/usecases/verify_otp.dart' as _i20;
import '../feature/pin_registration/repositories/pin_register_repository.dart'
    as _i16;
import '../feature/pin_registration/usecases/register_pin.dart' as _i15;
import '../feature/signup/repositories/user_signup_repository.dart' as _i19;
import '../feature/signup/usecases/submit_signup_info.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDomainGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AutheticateWithBiometrics>(() =>
      _i3.AutheticateWithBiometrics(
          get<_i4.BiometricAutheticationRepository>()));
  gh.lazySingleton<_i5.CheckBiometricsAvailable>(() =>
      _i5.CheckBiometricsAvailable(
          get<_i4.BiometricAutheticationRepository>()));
  gh.lazySingleton<_i6.GenerateOtp>(
      () => _i6.GenerateOtp(get<_i7.OtpAuthenticationRepository>()));
  gh.lazySingleton<_i8.GetApiErrorStream>(
      () => _i8.GetApiErrorStream(get<_i9.ApiErrorHandlerRepository>()));
  gh.lazySingleton<_i10.GetAppSettings>(
      () => _i10.GetAppSettings(get<_i11.AppSettingsRepository>()));
  gh.lazySingleton<_i12.GetAppSettings>(
      () => _i12.GetAppSettings(get<_i11.AppSettingsRepository>()));
  gh.lazySingleton<_i13.GetDefaultLanguage>(
      () => _i13.GetDefaultLanguage(get<_i14.LocalStorageRepository>()));
  gh.lazySingleton<_i15.RegisterPin>(
      () => _i15.RegisterPin(get<_i16.PinRegisterRepository>()));
  gh.lazySingleton<_i17.SetDefaultLanguage>(
      () => _i17.SetDefaultLanguage(get<_i14.LocalStorageRepository>()));
  gh.lazySingleton<_i18.SubmitSignupInfo>(
      () => _i18.SubmitSignupInfo(get<_i19.UserSignupRepository>()));
  gh.lazySingleton<_i20.VerifyOtp>(
      () => _i20.VerifyOtp(get<_i7.OtpAuthenticationRepository>()));
  return get;
}
