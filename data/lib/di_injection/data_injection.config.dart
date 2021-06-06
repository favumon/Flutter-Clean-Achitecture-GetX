// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity/connectivity.dart' as _i20;
import 'package:dio/dio.dart' as _i11;
import 'package:domain/feature/api_error_handler/repositories/api_error_handler_repository.dart'
    as _i24;
import 'package:domain/feature/app_settings/repositories/app_settings_repository.dart'
    as _i27;
import 'package:domain/feature/biometric_authetication/repositories/biometric_authetication_repository.dart'
    as _i9;
import 'package:domain/feature/local_storage/repositories/local_storage_repository.dart'
    as _i14;
import 'package:domain/feature/otp_verification/repositories/otp_authentication_repository.dart'
    as _i30;
import 'package:domain/feature/pin_registration/repositories/pin_register_repository.dart'
    as _i17;
import 'package:domain/feature/signup/repositories/user_signup_repository.dart'
    as _i22;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:local_auth/local_auth.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../core/constants/api_endpoints.dart' as _i3;
import '../core/constants/api_endpoints_nec.dart' as _i4;
import '../core/device/biometric_authetication.dart' as _i6;
import '../core/device/local_storage.dart' as _i12;
import '../core/remote_api.dart' as _i19;
import '../feature/api_error_handling/repositories/api_error_handler_repository_impl.dart'
    as _i25;
import '../feature/app_settings/data_sources/app_settings_remote_data_source.dart'
    as _i26;
import '../feature/app_settings/repositories/app_settings_repository_impl.dart'
    as _i28;
import '../feature/biometric_authetication/data_sources/biometric_authetication_data_source.dart'
    as _i8;
import '../feature/biometric_authetication/repositories/biometric_authetication_repository_impl.dart'
    as _i10;
import '../feature/local_storage/data_source/local_storage_data_source.dart'
    as _i13;
import '../feature/local_storage/local_storage_repository_impl.dart' as _i15;
import '../feature/otp_authentication/data_sources/otp_authentication_data_source.dart'
    as _i29;
import '../feature/otp_authentication/repositories/otp_authentication_repository_impl.dart'
    as _i31;
import '../feature/pin_registration/data_sources/pin_register_data_source.dart'
    as _i16;
import '../feature/pin_registration/repositories/pin_registration_repository_impl.dart'
    as _i18;
import '../feature/signup/data_sources/user_signup_remote_data_source.dart'
    as _i21;
import '../feature/signup/repositories/user_signup_repository_impl.dart'
    as _i23;
import 'register_module.dart' as _i32;

const String _developmentNec = 'developmentNec';
const String _productionNec = 'productionNec';
const String _development = 'development';
const String _production = 'production';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initDataGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.ApiEndpoints>(() => _i4.ApiEndpointsDev(),
      registerFor: {_developmentNec});
  gh.lazySingleton<_i3.ApiEndpoints>(() => _i4.ApiEndpointsProd(),
      registerFor: {_productionNec});
  gh.lazySingleton<_i3.ApiEndpoints>(() => _i3.ApiEndpointsDev(),
      registerFor: {_development});
  gh.lazySingleton<_i3.ApiEndpoints>(() => _i3.ApiEndpointsProd(),
      registerFor: {_production});
  await gh.factoryAsync<_i5.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i6.BimetricAuthetication>(
      () => _i6.BimetricAuthetication(get<_i7.LocalAuthentication>()));
  gh.lazySingleton<_i8.BiometricAutheticationDataSource>(() =>
      _i8.BiometricAutheticationDataSource(get<_i6.BimetricAuthetication>()));
  gh.lazySingleton<_i9.BiometricAutheticationRepository>(() =>
      _i10.BiometricAutheticationRepositoryImpl(
          get<_i8.BiometricAutheticationDataSource>()));
  gh.lazySingleton<_i11.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.lazySingleton<_i12.LocalStorage>(
      () => _i12.LocalStorage(get<_i5.SharedPreferences>()));
  gh.lazySingleton<_i13.LocalStorageDataSource>(
      () => _i13.LocalStorageDataSource(get<_i12.LocalStorage>()));
  gh.lazySingleton<_i14.LocalStorageRepository>(() =>
      _i15.LocalStorageRepositoryImpl(get<_i13.LocalStorageDataSource>()));
  gh.lazySingleton<_i16.PinRegisterDataSource>(
      () => _i16.PinRegisterDataSource(get<_i12.LocalStorage>()));
  gh.lazySingleton<_i17.PinRegisterRepository>(
      () => _i18.PinRegisterRepositoryImpl(get<_i16.PinRegisterDataSource>()));
  gh.lazySingleton<_i19.RemoteApi>(
      () => _i19.RemoteApiImpl(get<_i11.Dio>(), get<_i20.Connectivity>(),
          get<_i12.LocalStorage>(), get<_i3.ApiEndpoints>(), get<_i11.Dio>()),
      dispose: (i) => i.onDispose());
  gh.lazySingleton<_i21.UserSignupRemoteDataSource>(() =>
      _i21.UserSignupRemoteDataSource(
          get<_i19.RemoteApi>(), get<_i3.ApiEndpoints>()));
  gh.lazySingleton<_i22.UserSignupRepository>(() =>
      _i23.UserSignupRepositoryImpl(get<_i21.UserSignupRemoteDataSource>()));
  gh.lazySingleton<_i24.ApiErrorHandlerRepository>(
      () => _i25.ApiErrorHandlerRepositoryImpl(get<_i19.RemoteApi>()));
  gh.lazySingleton<_i26.AppSettingsRemoteDataSource>(() =>
      _i26.AppSettingsRemoteDataSource(
          get<_i19.RemoteApi>(), get<_i3.ApiEndpoints>()));
  gh.lazySingleton<_i27.AppSettingsRepository>(() =>
      _i28.AppSettingsRepositoryImpl(get<_i26.AppSettingsRemoteDataSource>()));
  gh.lazySingleton<_i29.OtpAutheticationDataSource>(() =>
      _i29.OtpAutheticationDataSource(
          get<_i19.RemoteApi>(), get<_i3.ApiEndpoints>()));
  gh.lazySingleton<_i30.OtpAuthenticationRepository>(() =>
      _i31.OtpAuthenticationRepositoryImpl(
          get<_i29.OtpAutheticationDataSource>()));
  gh.singleton<_i20.Connectivity>(registerModule.connectivity);
  gh.singleton<_i7.LocalAuthentication>(registerModule.localAuthentication);
  return get;
}

class _$RegisterModule extends _i32.RegisterModule {
  @override
  _i20.Connectivity get connectivity => _i20.Connectivity();
  @override
  _i7.LocalAuthentication get localAuthentication => _i7.LocalAuthentication();
}
