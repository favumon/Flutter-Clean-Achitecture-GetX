import 'package:domain/feature/app_settings/entities/app_settings.dart';
import 'package:domain/feature/local_storage/usecases/set_default_language.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:symex_mobile_v2/app_config/routes/app_routes.dart';
import 'package:symex_mobile_v2/core/services/navigation_service.dart';

@injectable
class LanguageSelectionPageController extends GetxController {
  final SetDefaultLanguage setDefaultLanguage;
  final NavigationService _navigationService;
  final AppSettings appSettings;

  LanguageSelectionPageController(
      this.setDefaultLanguage, this._navigationService, this.appSettings);

  void onLanguageSelected(String selectedLanguage) {
    setDefaultLanguage(SetDefaultLanguageParams(language: selectedLanguage));
    _navigationService.navigateAndReplace(AppRouts.loginPage);
  }
}
