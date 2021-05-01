import 'package:injectable/injectable.dart';

import 'domain_injection.config.dart';

@InjectableInit(initializerName: r'$initDomainGetIt')
void configureDomainDependencies(getIt) {
  $initDomainGetIt(getIt);
}
