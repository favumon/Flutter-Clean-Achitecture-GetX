import 'package:injectable/injectable.dart';

abstract class BuildEnvironment {
  static const String development = 'development';
  static const String production = 'production';
  static const String developmentNec = 'developmentNec';
  static const String productionNec = 'productionNec';
}

enum BuildEnvironments { dev, prod, necDev, necProd }

abstract class CurrentEnvironment {
  BuildEnvironments get environment;
}

@LazySingleton(as: CurrentEnvironment, env: [BuildEnvironment.development])
class CurrentEnvironmentImplDev extends CurrentEnvironment {
  @override
  get environment => BuildEnvironments.dev;
}

@LazySingleton(as: CurrentEnvironment, env: [BuildEnvironment.production])
class CurrentEnvironmentImplProd extends CurrentEnvironment {
  @override
  get environment => BuildEnvironments.prod;
}

@LazySingleton(as: CurrentEnvironment, env: [BuildEnvironment.developmentNec])
class CurrentEnvironmentImplNecDev extends CurrentEnvironment {
  @override
  get environment => BuildEnvironments.necDev;
}

@LazySingleton(as: CurrentEnvironment, env: [BuildEnvironment.productionNec])
class CurrentEnvironmentImplNecProd extends CurrentEnvironment {
  @override
  get environment => BuildEnvironments.necProd;
}
