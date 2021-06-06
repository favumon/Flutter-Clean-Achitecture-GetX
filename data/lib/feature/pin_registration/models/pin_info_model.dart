import 'package:domain/feature/pin_registration/entities/pin_info.dart';
import 'package:domain/feature/signup/entities/signup_info.dart';

class PinInfoModel extends PinInfo {
  final String pin;
  PinInfoModel(this.pin) : super(pin);
}
