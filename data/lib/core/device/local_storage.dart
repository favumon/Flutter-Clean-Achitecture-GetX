import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const userToken = 'user_token';
const defaultLanguage = 'default_language';
const loginPin = 'login_pin';

@lazySingleton
class LocalStorage {
  final SharedPreferences sharedPreferences;

  LocalStorage(this.sharedPreferences);
  String? getString(String key) => sharedPreferences.getString(key);
  Future<bool> saveString(String key, String value) =>
      sharedPreferences.setString(key, value);
}
