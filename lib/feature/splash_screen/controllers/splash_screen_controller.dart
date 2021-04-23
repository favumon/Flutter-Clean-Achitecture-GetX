import 'package:data/teest.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashScreenController extends GetxController {
  final MyTest test;

  SplashScreenController(this.test) {
    if (test != null) {}
  }
}
