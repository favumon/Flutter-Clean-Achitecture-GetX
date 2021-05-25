// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:domain/feature/api_error_handler/usecases/get_api_error_stream.dart'
    as _i14;
import 'package:domain/feature/app_settings/entities/app_settings.dart' as _i12;
import 'package:domain/feature/app_settings/usecases/get_app_settings.dart'
    as _i16;
import 'package:domain/feature/local_storage/usecases/get_default_language.dart'
    as _i9;
import 'package:domain/feature/local_storage/usecases/set_default_language.dart'
    as _i11;
import 'package:get/get.dart' as _i6;
import 'package:get/instance_manager.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/services/api_error_handler_service.dart' as _i13;
import '../core/services/app_settings_service.dart' as _i15;
import '../core/services/navigation_service.dart' as _i5;
import '../core/services/snackbar_service.dart' as _i7;
import '../feature/language_selection/controllers/language_selection_page_controller.dart'
    as _i10;
import '../feature/login/controllers/login_page_controller.dart' as _i4;
import '../feature/splash_screen/controllers/splash_screen_controller.dart'
    as _i8;
import 'register_module.dart' as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.GetInterface>(() => registerModule.gets());
  gh.lazySingleton<_i1.GetIt>(() => registerModule.getit());
  gh.factory<_i4.LoginPageController>(() => _i4.LoginPageController());
  gh.lazySingleton<_i5.NavigationService>(
      () => _i5.NavigationService(get<_i6.GetInterface>()));
  gh.lazySingleton<_i7.SnackbarService>(
      () => _i7.SnackbarService(get<_i6.GetInterface>()));
  gh.factory<_i8.SplashScreenController>(() => _i8.SplashScreenController(
      get<_i1.GetIt>(),
      get<_i9.GetDefaultLanguage>(),
      get<_i5.NavigationService>()));
  gh.factory<_i10.LanguageSelectionPageController>(() =>
      _i10.LanguageSelectionPageController(get<_i11.SetDefaultLanguage>(),
          get<_i5.NavigationService>(), get<_i12.AppSettings>()));
  gh.singleton<_i13.ApiErrorHandlerService>(
      _i13.ApiErrorHandlerServiceImpl(
          get<_i7.SnackbarService>(), get<_i14.GetApiErrorStream>()),
      dispose: (i) => i.onDispose());
  gh.singleton<_i15.AppSettingsService>(
      _i15.AppSettingsService(get<_i16.GetAppSettings>(), get<_i1.GetIt>()),
      signalsReady: true);
  return get;
}

class _$RegisterModule extends _i17.RegisterModule {}
