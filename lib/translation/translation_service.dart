import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ar_sa.dart';
import 'en_us.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'ar_SA': ar_SA,
      };
}
