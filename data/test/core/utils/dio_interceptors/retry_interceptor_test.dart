import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:core/error/failures.dart';
import 'package:data/core/utils/dio_interceptors/retry_interceptor/retry_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'retry_interceptor_test.mocks.dart';

@GenerateMocks([
  Dio,
  Logger,
  Connectivity,
  DioError,
  ErrorInterceptorHandler,
  Response,
  RequestOptions,
])
main() {
  late MockDio mockDio;
  late MockLogger mockLogger;
  late MockConnectivity mockConnectivity;
  late StreamSink<Failure> networkErrorListner;
  late MockDioError mockDioError;
  late MockErrorInterceptorHandler mockErrorInterceptorHandler;
  late RetryInterceptor retryInterceptor;
  late StreamController<Failure> _networkExceptionListner;
  late MockResponse<Map<String, dynamic>>? mockResponse;
  late MockRequestOptions mockRequestOptions;
  setUp(() {
    mockDio = MockDio();
    mockLogger = MockLogger();
    mockConnectivity = MockConnectivity();
    mockDioError = MockDioError();
    mockErrorInterceptorHandler = MockErrorInterceptorHandler();
    mockResponse = MockResponse();
    mockRequestOptions = MockRequestOptions();

    _networkExceptionListner = StreamController();
    networkErrorListner = _networkExceptionListner.sink;

    retryInterceptor = RetryInterceptor(
        dio: mockDio,
        logger: mockLogger,
        connectivity: mockConnectivity,
        networkErrorListner: networkErrorListner);
  });

  tearDown(() {
    networkErrorListner.close();
    _networkExceptionListner.close();
  });

  test('should emit NetworkException when there is Socket excepttion',
      () async {
    when(mockDioError.type).thenReturn(DioErrorType.other);
    when(mockDioError.error).thenReturn(SocketException('Socket exception'));

    retryInterceptor.onError(mockDioError, mockErrorInterceptorHandler);

    expectLater(_networkExceptionListner.stream, emits(NetworkFailure()));
  });

  test('should listen for connectivity change when there is Socket excepttion',
      () async {
    StreamController<ConnectivityResult> controller =
        StreamController<ConnectivityResult>();

    Stream<ConnectivityResult> stream = controller.stream;

    when(mockDioError.type).thenReturn(DioErrorType.other);
    when(mockDioError.error).thenReturn(SocketException('Socket exception'));

    when(mockConnectivity.onConnectivityChanged)
        .thenAnswer((realInvocation) => stream);

    retryInterceptor.onError(mockDioError, mockErrorInterceptorHandler);

    await untilCalled(mockConnectivity.onConnectivityChanged);

    verify(mockConnectivity.onConnectivityChanged);

    expectLater(_networkExceptionListner.stream, emits(NetworkFailure()));

    controller.close();
  });

  test('should re-fetch request when there is a network connectivity change',
      () async {
    StreamController<ConnectivityResult> controller =
        StreamController<ConnectivityResult>.broadcast();

    Stream<ConnectivityResult> stream = controller.stream;

    when(mockDioError.type).thenReturn(DioErrorType.other);
    when(mockDioError.error).thenReturn(SocketException('Socket exception'));
    when(mockDio.fetch(mockRequestOptions))
        .thenAnswer((realInvocation) => Future.value(mockResponse));

    when(mockDioError.requestOptions).thenReturn(mockRequestOptions);

    when(mockConnectivity.onConnectivityChanged).thenAnswer(
        (realInvocation) => Stream.value(ConnectivityResult.mobile));

    retryInterceptor.onError(mockDioError, mockErrorInterceptorHandler);

    expectLater(stream, emits(ConnectivityResult.mobile));
    controller.add(ConnectivityResult.mobile);

    await untilCalled(mockDio.fetch(mockRequestOptions));

    verify(mockDio.fetch(mockRequestOptions));

    controller.close();
  });
}
