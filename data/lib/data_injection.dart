import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data_injection.config.dart';

@InjectableInit(
    initializerName: r'$initDataGetIt', preferRelativeImports: false)
void configureDataDependencies(getIt) {
  $initDataGetIt(getIt);
}
