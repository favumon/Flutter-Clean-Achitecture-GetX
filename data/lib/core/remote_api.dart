import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:data/core/constants/api_endpoints.dart';
import 'package:data/core/local_storage.dart';
import 'package:data/core/utils/dio_interceptors/dio_logger.dart';
import 'package:data/core/utils/dio_interceptors/retry_interceptor/retry_interceptor.dart';
import 'package:data/core/utils/dio_interceptors/token_interceptor.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract class RemoteApi {
  Future<Either<Failure, Map<String, dynamic>>> apiGet(String url,
      {Map<String, dynamic>? queryParameters});
  Stream<Failure> get networkErrorListner;
  onDispose();
}

@LazySingleton(as: RemoteApi)
class RemoteApiImpl extends RemoteApi {
  final Dio dio;
  final Dio tokenDio;
  final Connectivity connectivity;
  final LocalStorage localStorage;
  final ApiEndpoints apiEndpoints;
  final StreamController<Failure> _networkExceptionListner = StreamController();

  @override
  get networkErrorListner => _networkExceptionListner.stream;

  @disposeMethod
  onDispose() {
    _networkExceptionListner.close();
  }

  RemoteApiImpl(this.dio, this.connectivity, this.localStorage,
      this.apiEndpoints, this.tokenDio) {
    dio.options.connectTimeout = 3000;
    dio.options.baseUrl = apiEndpoints.baseUrl;
    final interceptors = [
      //  TokenInterceptor(dio, localStorage, tokenDio, apiEndpoints),
      RetryInterceptor(
          dio: dio,
          logger: Logger(),
          connectivity: connectivity,
          networkErrorListner: _networkExceptionListner.sink),
      if (kDebugMode) DioLogger()
    ];

    // String PEM = 'XXXXX'; // certificate content
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.interceptors.addAll(interceptors);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> apiGet(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      var response = await dio.get(path, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return Right(response.data);
      } else
        return Left(ServerFailure(message: response.statusMessage));
    } catch (e) {
      Left(NetworkFailure(message: e.toString()));
    }

    return Left(NetworkFailure());
  }
}
