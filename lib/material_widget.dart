import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_config/routes/app_pages.dart';
import 'app_config/routes/app_routes.dart';
import 'app_config/translation/translation_service.dart';
import 'feature/splash_screen/pages/splash_screen_page.dart';

class MaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
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
