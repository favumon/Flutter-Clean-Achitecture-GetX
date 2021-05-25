import 'package:get/get.dart';
import 'package:symex_mobile_v2/feature/language_selection/pages/language_selection_page.dart';
import 'package:symex_mobile_v2/feature/login/pages/login_page.dart';
import 'package:symex_mobile_v2/feature/splash_screen/pages/splash_screen_page.dart';
import 'package:symex_mobile_v2/app_config/routes/app_routes.dart';

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
