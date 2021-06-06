import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  Connectivity get connectivity;
  @singleton
  LocalAuthentication get localAuthentication;

  @Named("BaseUrl")
  String get baseUrl => 'My base url';

  // url here will be injected
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));

  @preResolve // if you need to pre resolve the value
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();
}
