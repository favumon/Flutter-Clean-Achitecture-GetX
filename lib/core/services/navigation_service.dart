import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NavigationService {
  final GetInterface get;
  NavigationService(this.get);

  void navigate(String route) {
    get.toNamed(route);
  }

  void navigateAndReplace(String route) {
    get.offAndToNamed(route);
  }
}
