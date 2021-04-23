import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'options.dart';

/// An interceptor that will try to send failed request again
class RetryInterceptor extends Interceptor {
  final Dio dio;
  final Logger logger;
  final RetryOptions options;
  final Connectivity connectivity;

  RetryInterceptor(
      {required this.dio,
      required this.logger,
      required this.connectivity,
      options})
      : this.options = options ?? const RetryOptions();

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_isNetworkIssue(err)) {
      // Incase of 'No internet' which throws a SocketException
      try {
        // ignore: cancel_subscriptions
        StreamSubscription? streamSubscription;
        streamSubscription = connectivity.onConnectivityChanged.listen(
          (connectivityResult) async {
            if (connectivityResult != ConnectivityResult.none) {
              streamSubscription!.cancel();
              dio
                  .fetch(err.requestOptions)
                  .then((value) => handler.resolve(value));
            }
          },
        );
      } catch (e) {
        return e;
      }
    } else if (_isTimeoutIssue(err)) {
      var extra = RetryOptions.fromExtra(err.requestOptions);

      var shouldRetry = extra.retries > 0 && await extra.retryEvaluator(err);
      if (shouldRetry) {
        if (extra.retryInterval.inMilliseconds > 0) {
          await Future.delayed(extra.retryInterval);
        }

        // Update options to decrease retry count before new try
        extra = extra.copyWith(retries: extra.retries - 1);
        err.requestOptions.extra = err.requestOptions.extra
          ..addAll(extra.toExtra());

        //   try {
        logger.w(
            "[${err.requestOptions.uri}] An error occured during request, trying a again (remaining tries: ${extra.retries}, error: ${err.error})");
        // We retry with the updated options
        try {
          return await this.dio.fetch(err.requestOptions);
        } catch (e) {
          return super.onError(err, handler);
        }
      }
      return super.onError(err, handler);
    }
  }

  bool _isNetworkIssue(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }

  bool _isTimeoutIssue(DioError err) {
    return err.type == DioErrorType.connectTimeout;
  }
}
