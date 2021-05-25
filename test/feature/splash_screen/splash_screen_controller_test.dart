import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/feature/local_storage/usecases/get_default_language.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:symex_mobile_v2/app_config/routes/app_routes.dart';
import 'package:symex_mobile_v2/core/services/navigation_service.dart';
import 'package:symex_mobile_v2/di_injection/injection_container.dart';
import 'package:symex_mobile_v2/feature/splash_screen/controllers/splash_screen_controller.dart';

import 'splash_screen_controller_test.mocks.dart';

@GenerateMocks([GetDefaultLanguage, NavigationService])
main() {
  late MockGetDefaultLanguage mockGetDefaultLanguage;
  late MockNavigationService mockNavigationService;
  GetIt ggetIt = getIt;

  setUp(() {
    mockGetDefaultLanguage = MockGetDefaultLanguage();
    mockNavigationService = MockNavigationService();
  });

  test('should navigate to Login page when default language has set', () async {
    SplashScreenController splashScreenController = SplashScreenController(
        ggetIt, mockGetDefaultLanguage, mockNavigationService);

    when(mockGetDefaultLanguage(any))
        .thenAnswer((realInvocation) => Future.value(Right('language')));

    splashScreenController.navigate();

    verify(mockGetDefaultLanguage(any));

    await untilCalled(
        mockNavigationService.navigateAndReplace(AppRouts.loginPage));

    verify(mockNavigationService.navigateAndReplace(AppRouts.loginPage));
  });
  test(
      'should navigate to Language selection page when default language not set',
      () async {
    SplashScreenController splashScreenController = SplashScreenController(
        ggetIt, mockGetDefaultLanguage, mockNavigationService);

    when(mockGetDefaultLanguage(any)).thenAnswer(
        (realInvocation) => Future.value(Left(LocalStorageFailure())));

    splashScreenController.navigate();

    verify(mockGetDefaultLanguage(any));

    await untilCalled(mockNavigationService
        .navigateAndReplace(AppRouts.languageSelectionPage));

    verify(mockNavigationService
        .navigateAndReplace(AppRouts.languageSelectionPage));
  });
}
