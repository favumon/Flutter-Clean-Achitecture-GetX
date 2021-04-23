import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  String? getString(String key);
}

class LocalStorageImpl extends LocalStorage {
  final SharedPreferences sharedPreferences;

  LocalStorageImpl(this.sharedPreferences);
  @override
  String? getString(String key) => sharedPreferences.getString(key);
}
