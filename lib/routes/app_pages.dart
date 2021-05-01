import 'package:get/get.dart';
import '../feature/splash_screen/pages/splash_screen_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRouts.initial,
      page: () => SplashScreen(),
    ),
    //GetPage(name: Routes.DETAILS, page:()=> (), binding: DetailsBinding()),
  ];
}
