import 'package:core/constants/build_environment.dart';
import 'package:injectable/injectable.dart';

import 'api_endpoints.dart';

@LazySingleton(env: [BuildEnvironment.developmentNec], as: ApiEndpoints)
class ApiEndpointsDev extends ApiEndpoints {
  @override
  String baseUrl = 'https://run.mocky.io/';
}

@LazySingleton(env: [BuildEnvironment.productionNec], as: ApiEndpoints)
class ApiEndpointsProd extends ApiEndpoints {
  @override
  String baseUrl = 'https://run.mocky.io/';
}
