import 'package:get/instance_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_container.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  GetInterface gets() => Get;
  @lazySingleton
  GetIt getit() => getIt;
}
