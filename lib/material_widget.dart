import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_config/routes/app_pages.dart';
import 'app_config/routes/app_routes.dart';
import 'app_config/theme/theme.dart';
import 'app_config/translation/translation_service.dart';
import 'di_injection/injection_container.dart';
import 'feature/splash_screen/pages/splash_screen_page.dart';

class MaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Apptheme apptheme = getIt();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: apptheme.theme,
      home: SplashScreen(),
      initialRoute: AppRouts.initial,
      getPages: AppPages.pages,
      translations: TranslationService(), // your translations
      locale: TranslationService
          .locale, // translations will be displayed in that locale
      fallbackLocale: Locale('en', 'US'),
    );
  }
}
