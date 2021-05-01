import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:core/error/failures.dart';
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
  apiGet(String url);
  Stream<Failure> get networkInfoListner;
  onDispose();
}

@LazySingleton(as: RemoteApi)
class RemoteApiImpl extends RemoteApi {
  final Dio dio;
  final Connectivity connectivity;
  final LocalStorage localStorage;
  final StreamController<Failure> _networkExceptionListner = StreamController();

  @override
  get networkInfoListner => _networkExceptionListner.stream;

  @disposeMethod
  onDispose() {
    _networkExceptionListner.close();
  }

  RemoteApiImpl(this.dio, this.connectivity, this.localStorage) {
    dio.options.connectTimeout = 3000;
    final interceptors = [
      // TokenInterceptor(dio, localStorage),
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
  apiGet(String url) async {
    try {
      var r = await dio.get(url);
      if (r != null) {}
    } catch (e) {
      if (e != null) {}
    }
  }
}
