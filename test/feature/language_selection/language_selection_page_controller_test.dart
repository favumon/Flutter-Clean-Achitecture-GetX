import 'package:dartz/dartz.dart';
import 'package:domain/feature/app_settings/entities/app_settings.dart';
import 'package:domain/feature/local_storage/usecases/set_default_language.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:symex_mobile_v2/app_config/routes/app_routes.dart';
import 'package:symex_mobile_v2/core/services/navigation_service.dart';
import 'package:symex_mobile_v2/feature/language_selection/controllers/language_selection_page_controller.dart';

import 'language_selection_page_controller_test.mocks.dart';

@GenerateMocks([SetDefaultLanguage, NavigationService, AppSettings])
main() {
  late MockSetDefaultLanguage mockSetDefaultLanguage;
  late MockNavigationService mockNavigationService;
  late MockAppSettings mockAppSettings;

  setUp(() {
    mockSetDefaultLanguage = MockSetDefaultLanguage();
    mockNavigationService = MockNavigationService();
    mockAppSettings = MockAppSettings();
  });

  test('should call SetDefaultLanguage usecase when language selected',
      () async {
    LanguageSelectionPageController languageSelectionPageController =
        LanguageSelectionPageController(
            mockSetDefaultLanguage, mockNavigationService, mockAppSettings);

    var selectedLanguage = 'en-US';
    var selectedLanguageParam =
        SetDefaultLanguageParams(language: selectedLanguage);

    when(mockSetDefaultLanguage(selectedLanguageParam))
        .thenAnswer((realInvocation) => Future.value(Right(true)));

    languageSelectionPageController.onLanguageSelected(selectedLanguage);

    verify(mockSetDefaultLanguage(selectedLanguageParam));
  });
  test('should navigate to Login page when language selected', () async {
    LanguageSelectionPageController languageSelectionPageController =
        LanguageSelectionPageController(
            mockSetDefaultLanguage, mockNavigationService, mockAppSettings);

    var selectedLanguage = 'en-US';
    var selectedLanguageParam =
        SetDefaultLanguageParams(language: selectedLanguage);

    when(mockSetDefaultLanguage(selectedLanguageParam))
        .thenAnswer((realInvocation) => Future.value(Right(true)));

    languageSelectionPageController.onLanguageSelected(selectedLanguage);

    await untilCalled(
        mockNavigationService.navigateAndReplace(AppRouts.loginPage));

    verify(mockNavigationService.navigateAndReplace(AppRouts.loginPage));
  });
}
