import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:data/core/constants/api_endpoints.dart';
import 'package:data/core/device/local_storage.dart';
import 'package:data/core/remote_api.dart';
import 'package:data/feature/app_settings/models/app_settings_model.dart';
import 'package:data/feature/pin_registration/models/pin_info_model.dart';
import 'package:data/feature/signup/models/signup_info_model.dart';
import 'package:data/feature/signup/models/signup_response_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PinRegisterDataSource {
  final LocalStorage localStorage;

  PinRegisterDataSource(this.localStorage);

  Future<Either<Failure, void>> submitSignupInfo(PinInfoModel pinInfo) async {
    localStorage.saveString(loginPin, pinInfo.pin);
    return Future.value(Right(null));
  }
}
