import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:data/core/local_storage.dart';
import 'package:data/core/utils/dio_interceptors/dio_logger.dart';
import 'package:data/core/utils/dio_interceptors/retry_interceptor/retry_interceptor.dart';
import 'package:data/core/utils/dio_interceptors/token_interceptor.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

abstract class RemoteApi {}

class RemoteApiImpl extends RemoteApi {
  final Dio dio;
  final Connectivity connectivity;
  final LocalStorage localStorage;

  RemoteApiImpl(this.dio, this.connectivity, this.localStorage) {
    dio.options.connectTimeout = 3000;
    final interceptors = [
      // RetryOnConnectionChangeInterceptor(
      //   dio: dio,
      //   connectivity: connectivity,
      // ),
      //  TokenInterceptor(dio, localStorage),
      RetryInterceptor(dio: dio, logger: Logger(), connectivity: connectivity),
      // if (kDebugMode) DioLogger()
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

  apiGet(String url) async {
    try {
      var r = await dio.get(url);
      if (r != null) {}
    } catch (e) {
      if (e != null) {}
    }
  }
}
