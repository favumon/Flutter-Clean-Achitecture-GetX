// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity/connectivity.dart' as _i8;
import 'package:dio/dio.dart' as _i5;
import 'package:domain/feature/api_error_handler/repositories/api_error_handler_repository.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../core/local_storage.dart' as _i6;
import '../core/remote_api.dart' as _i7;
import '../feature/network_sensitivity/repositories/api_error_handler_repository_impl.dart'
    as _i10;
import '../teest.dart' as _i3;
import 'register_module.dart' as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initDataGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.MyTest>(() => _i3.MyTest());
  await gh.factoryAsync<_i4.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i5.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.lazySingleton<_i6.LocalStorage>(
      () => _i6.LocalStorageImpl(get<_i4.SharedPreferences>()));
  gh.lazySingleton<_i7.RemoteApi>(
      () => _i7.RemoteApiImpl(
          get<_i5.Dio>(), get<_i8.Connectivity>(), get<_i6.LocalStorage>()),
      dispose: (i) => i.onDispose());
  gh.lazySingleton<_i9.ApiErrorHandlerRepository>(
      () => _i10.ApiErrorHandlerRepositoryImpl(get<_i7.RemoteApi>()));
  gh.singleton<_i8.Connectivity>(registerModule.connectivity);
  return get;
}

class _$RegisterModule extends _i11.RegisterModule {
  @override
  _i8.Connectivity get connectivity => _i8.Connectivity();
}
