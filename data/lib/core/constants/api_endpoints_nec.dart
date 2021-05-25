import 'package:core/constants/build_environment.dart';
import 'package:injectable/injectable.dart';

import 'api_endpoints.dart';

@LazySingleton(env: [BuildEnvironment.developmentNec], as: ApiEndpoints)
class ApiEndpointsDev extends ApiEndpoints {
  String token = '/token';
  String baseUrl = 'https://run.mocky.io/';
  String appsettings = 'v3/108dfa4a-eee8-4b60-86f8-2d0f2e36ee4c';
}

@LazySingleton(env: [BuildEnvironment.productionNec], as: ApiEndpoints)
class ApiEndpointsProd extends ApiEndpoints {
  String token = '/token';
  String baseUrl = 'https://run.mocky.io/';
  String appsettings = 'v3/108dfa4a-eee8-4b60-86f8-2d0f2e36ee4c';
}
