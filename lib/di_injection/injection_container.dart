import 'package:data/di_injection/data_injection.config.dart';
import 'package:domain/di_injection/domain_injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_injection/../injection_container.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await $initDataGetIt(getIt);
  $initDomainGetIt(getIt);
  await $initGetIt(getIt);
}
