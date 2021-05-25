// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity/connectivity.dart' as _i12;
import 'package:dio/dio.dart' as _i6;
import 'package:domain/feature/api_error_handler/repositories/api_error_handler_repository.dart'
    as _i13;
import 'package:domain/feature/app_settings/repositories/app_settings_repository.dart'
    as _i16;
import 'package:domain/feature/local_storage/repositories/local_storage_repository.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../core/constants/api_endpoints.dart' as _i3;
import '../core/constants/api_endpoints_nec.dart' as _i4;
import '../core/local_storage.dart' as _i7;
import '../core/remote_api.dart' as _i11;
import '../feature/api_error_handling/repositories/api_error_handler_repository_impl.dart'
    as _i14;
import '../feature/app_settings/data_sources/app_settings_remote_data_source.dart'
    as _i15;
import '../feature/app_settings/repositories/app_settings_repository_impl.dart'
    as _i17;
import '../feature/local_storage/data_source/local_storage_data_source.dart'
    as _i8;
import '../feature/local_storage/local_storage_repository_impl.dart' as _i10;
import 'register_module.dart' as _i18;

const String _development = 'development';
const String _production = 'production';
const String _developmentNec = 'developmentNec';
const String _productionNec = 'productionNec';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initDataGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.ApiEndpoints>(() => _i3.ApiEndpointsDev(),
      registerFor: {_development});
  gh.lazySingleton<_i3.ApiEndpoints>(() => _i3.ApiEndpointsProd(),
      registerFor: {_production});
  gh.lazySingleton<_i3.ApiEndpoints>(() => _i4.ApiEndpointsDev(),
      registerFor: {_developmentNec});
  gh.lazySingleton<_i3.ApiEndpoints>(() => _i4.ApiEndpointsProd(),
      registerFor: {_productionNec});
  await gh.factoryAsync<_i5.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i6.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.lazySingleton<_i7.LocalStorage>(
      () => _i7.LocalStorageImpl(get<_i5.SharedPreferences>()));
  gh.lazySingleton<_i8.LocalStorageDataSource>(
      () => _i8.LocalStorageDataSource(get<_i7.LocalStorage>()));
  gh.lazySingleton<_i9.LocalStorageRepository>(
      () => _i10.LocalStorageRepositoryImpl(get<_i8.LocalStorageDataSource>()));
  gh.lazySingleton<_i11.RemoteApi>(
      () => _i11.RemoteApiImpl(get<_i6.Dio>(), get<_i12.Connectivity>(),
          get<_i7.LocalStorage>(), get<_i3.ApiEndpoints>(), get<_i6.Dio>()),
      dispose: (i) => i.onDispose());
  gh.lazySingleton<_i13.ApiErrorHandlerRepository>(
      () => _i14.ApiErrorHandlerRepositoryImpl(get<_i11.RemoteApi>()));
  gh.lazySingleton<_i15.AppSettingsRemoteDataSource>(() =>
      _i15.AppSettingsRemoteDataSource(
          get<_i11.RemoteApi>(), get<_i3.ApiEndpoints>()));
  gh.lazySingleton<_i16.AppSettingsRepository>(() =>
      _i17.AppSettingsRepositoryImpl(get<_i15.AppSettingsRemoteDataSource>()));
  gh.singleton<_i12.Connectivity>(registerModule.connectivity);
  return get;
}

class _$RegisterModule extends _i18.RegisterModule {
  @override
  _i12.Connectivity get connectivity => _i12.Connectivity();
}
