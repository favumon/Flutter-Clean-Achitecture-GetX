// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data/core/remote_api.dart' as _i7;
import 'package:domain/feature/api_error_handler/usecases/get_api_error_stream.dart'
    as _i9;
import 'package:get/get.dart' as _i5;
import 'package:get/instance_manager.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/services/api_error_handler_service.dart' as _i8;
import '../core/services/snackbar_service.dart' as _i4;
import '../feature/splash_screen/controllers/splash_screen_controller.dart'
    as _i6;
import 'register_module.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.GetInterface>(() => registerModule.gets());
  gh.lazySingleton<_i4.SnackbarService>(
      () => _i4.SnackbarSeviceImpl(get<_i5.GetInterface>()));
  gh.factory<_i6.SplashScreenController>(
      () => _i6.SplashScreenController(get<_i7.RemoteApi>()));
  gh.singleton<_i8.ApiErrorHandlerService>(
      _i8.ApiErrorHandlerServiceImpl(
          get<_i4.SnackbarService>(), get<_i9.GetApiErrorStream>()),
      dispose: (i) => i.onDispose());
  return get;
}

class _$RegisterModule extends _i10.RegisterModule {}
