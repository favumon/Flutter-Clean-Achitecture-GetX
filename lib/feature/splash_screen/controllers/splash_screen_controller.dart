import 'package:core/constants/build_environment.dart';
import 'package:core/usecases/usecase.dart';
import 'package:domain/feature/local_storage/usecases/get_default_language.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../../../app_config/routes/app_routes.dart';
import '../../../di_injection/injection_container.dart';

import '../../../core/services/navigation_service.dart';

@injectable
class SplashScreenController extends GetxController {
  final GetIt _getIt;
  final GetDefaultLanguage _getDefaultLanguage;
  final NavigationService _navigationService;
  SplashScreenController(
      this._getIt, this._getDefaultLanguage, this._navigationService);

  @override
  onReady() {
    super.onReady();

    _checkDependenciesReady();
  }

  Future<void> navigate() async {
    var language = await _getDefaultLanguage(NoParams());

    language.fold((l) => _navigateToLanguageSelectionPage(),
        (r) => _navigateToLoginPage());
  }

  _navigateToLanguageSelectionPage() {
    _navigationService.navigateAndReplace(AppRouts.languageSelectionPage);
  }

  _navigateToLoginPage() {
    _navigationService.navigateAndReplace(AppRouts.loginPage);
  }

  Future<void> _checkDependenciesReady() async {
    await _getIt.allReady();

    navigate();
  }
}
