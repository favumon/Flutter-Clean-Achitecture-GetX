import 'package:core/error/failures.dart';
import 'package:domain/feature/otp_verification/usecases/generate_otp.dart';
import 'package:domain/feature/otp_verification/usecases/verify_otp.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../core/services/alert_service.dart';
import '../pages/otp_verification_page.dart';

@injectable
class OtpVerificationPageController extends GetxController {
  final GetInterface getx;
  late void Function(String) verficationSuccessCallback;
  final GenerateOtp generateOtp;
  final VerifyOtp verifyOtp;
  final AlertService alertService;
  late String otp;

  OtpVerificationPageController(
      this.getx, this.generateOtp, this.verifyOtp, this.alertService);

  @override
  void onInit() {
    verficationSuccessCallback =
        (getx.arguments as OtpVerificationParams).verficationSuccessCallback;
    var mobileNo = (getx.arguments as OtpVerificationParams).mobileNo;
    var email = (getx.arguments as OtpVerificationParams).email;

    generateOtp(GenerateOtpParams(email: email, mobileNo: mobileNo));

    super.onInit();
  }

  Future<void> onVerify() async {
    otp = '1234';
    alertService.showLoader();
    var response = await verifyOtp(VerifyOtpParams(otp));
    response.fold((l) {
      if (l is OtpVerificationFailure)
        alertService.showAlertSnackbar(title: '', message: l.message ?? '');
    }, (r) {
      verficationSuccessCallback(otp);
    });
  }
}
