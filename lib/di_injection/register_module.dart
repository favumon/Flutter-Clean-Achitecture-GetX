import 'package:get/instance_manager.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  GetInterface gets() => Get;
}
