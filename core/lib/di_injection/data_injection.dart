import 'package:injectable/injectable.dart';

import 'data_injection.config.dart';

@InjectableInit(initializerName: r'$initCoreGetIt')
void configureCoreDependencies(getIt) {
  $initCoreGetIt(getIt);
}
