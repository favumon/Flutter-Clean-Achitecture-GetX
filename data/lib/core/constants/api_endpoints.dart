import 'package:core/constants/build_environment.dart';
import 'package:injectable/injectable.dart';

abstract class ApiEndpoints {
  abstract String baseUrl;
  final String token = '/token';

  final String appsettings = 'v3/108dfa4a-eee8-4b60-86f8-2d0f2e36ee4c';
  final String generateOtp = 'v3/97c35559-4f8a-448b-9643-66402a85565e';
  final String signup = 'v3/97c35559-4f8a-448b-9643-66402a85565e';
  final String verifyOtp = 'v3/97c35559-4f8a-448b-9643-66402a85565e';
}

@LazySingleton(env: [BuildEnvironment.development], as: ApiEndpoints)
class ApiEndpointsDev extends ApiEndpoints {
  @override
  String baseUrl = 'https://run.mocky.io/';
}

@LazySingleton(env: [BuildEnvironment.production], as: ApiEndpoints)
class ApiEndpointsProd extends ApiEndpoints {
  @override
  String baseUrl = 'https://run.mocky.io/';
}
