import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const userToken = 'user_token';
const defaultLanguage = 'default_language';

abstract class LocalStorage {
  String? getString(String key);
  Future<bool> saveString(String key, String value);
}

@LazySingleton(as: LocalStorage)
class LocalStorageImpl extends LocalStorage {
  final SharedPreferences sharedPreferences;

  LocalStorageImpl(this.sharedPreferences);
  @override
  String? getString(String key) => sharedPreferences.getString(key);
  @override
  Future<bool> saveString(String key, value) =>
      sharedPreferences.setString(key, value);
}
