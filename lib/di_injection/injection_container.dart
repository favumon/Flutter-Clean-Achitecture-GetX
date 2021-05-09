import 'package:data/di_injection/data_injection.config.dart';
import 'package:domain/di_injection/domain_injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_injection/../injection_container.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies({String? environment}) async {
  await $initDataGetIt(getIt, environment: environment);
  $initDomainGetIt(getIt, environment: environment);
  $initGetIt(getIt, environment: environment);
}
