import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NavigationService {
  final GetInterface get;

  NavigationService(this.get);

  void navigate(String route, {dynamic arguments}) {
    get.toNamed(route, arguments: arguments);
  }

  void navigateAndReplace(String route) {
    get.offAndToNamed(route);
  }

  void navigateBackUntil(String route) {
    get.until((r) => r.settings.name == route);
  }

  void navigateAndClearStackUntil(String route,
      {bool Function(Route<dynamic>)? predicate}) {
    get.offAllNamed(route);
  }

  void navigateBack() {
    get.back();
  }
}
