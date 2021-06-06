import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../app_config/routes/app_routes.dart';
import '../../../core/services/navigation_service.dart';

@injectable
class BiometricRegistrationSuccessPageController extends GetxController {
  final NavigationService navigationService;

  BiometricRegistrationSuccessPageController(this.navigationService);

  void onGetStarted() {
    navigationService.navigateAndReplace(AppRouts.loginPage);
  }
}
