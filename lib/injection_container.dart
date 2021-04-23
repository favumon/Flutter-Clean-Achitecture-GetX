import 'package:data/data_injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_container.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  $initGetIt(getIt, environment: Environment.dev);
  $initDataGetIt(getIt, environment: 'sd');
}
