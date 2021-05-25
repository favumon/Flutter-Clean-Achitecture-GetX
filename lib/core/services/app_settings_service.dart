import 'package:core/usecases/usecase.dart';
import 'package:domain/feature/app_settings/entities/app_settings.dart';
import 'package:domain/feature/app_settings/usecases/get_app_settings.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@Singleton(signalsReady: true)
class AppSettingsService {
  final GetAppSettings getAppSettings;
  final GetIt getIt;

  late Future appsettingsFuture;

  AppSettingsService(this.getAppSettings, this.getIt) {
    init();
  }

  void init() async {
    var appsettings = await getAppSettings(NoParams());
    appsettings.fold((l) => null, (r) => getIt.registerSingleton(r));

    var v = getIt<AppSettings>();

    // appsettings.fold((l) => null, (r) => getIt.registerSingleton(r));

    getIt.signalReady(this);
  }
}
