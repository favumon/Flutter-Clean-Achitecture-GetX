import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class BimetricAuthetication {
  final LocalAuthentication _localAuthentication;

  BimetricAuthetication(this._localAuthentication);

  Future<bool> checkBiometricsAvailable() async {
    try {
      if (await _localAuthentication.canCheckBiometrics &&
          await _localAuthentication.isDeviceSupported()) return true;
    } catch (e) {}

    return false;
  }

  Future<bool> authenticateWithBiometrics(String promptMessage) async {
    try {
      if (await checkBiometricsAvailable() &&
          await _localAuthentication.authenticate(
              localizedReason: promptMessage)) {
        return true;
      }
    } catch (e) {}

    return false;
  }
}
