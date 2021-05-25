import 'package:get/get.dart';

import '../../feature/language_selection/pages/language_selection_page.dart';
import '../../feature/login/pages/login_page.dart';
import '../../feature/splash_screen/pages/splash_screen_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRouts.initial,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRouts.languageSelectionPage,
      page: () => LanguageSelectionPage(),
    ),
    GetPage(
      name: AppRouts.loginPage,
      page: () => LoginPage(),
    ),
  ];
}
