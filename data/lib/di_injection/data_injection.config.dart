// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity/connectivity.dart' as _i7;
import 'package:dio/dio.dart' as _i4;
import 'package:domain/feature/api_error_handler/repositories/api_error_handler_repository.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../core/local_storage.dart' as _i5;
import '../core/remote_api.dart' as _i6;
import '../feature/api_error_handling/repositories/api_error_handler_repository_impl.dart'
    as _i9;
import 'register_module.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initDataGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i3.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i4.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.lazySingleton<_i5.LocalStorage>(
      () => _i5.LocalStorageImpl(get<_i3.SharedPreferences>()));
  gh.lazySingleton<_i6.RemoteApi>(
      () => _i6.RemoteApiImpl(
          get<_i4.Dio>(), get<_i7.Connectivity>(), get<_i5.LocalStorage>()),
      dispose: (i) => i.onDispose());
  gh.lazySingleton<_i8.ApiErrorHandlerRepository>(
      () => _i9.ApiErrorHandlerRepositoryImpl(get<_i6.RemoteApi>()));
  gh.singleton<_i7.Connectivity>(registerModule.connectivity);
  return get;
}

class _$RegisterModule extends _i10.RegisterModule {
  @override
  _i7.Connectivity get connectivity => _i7.Connectivity();
}
