import 'dart:convert';
import 'dart:ffi';

import 'package:data/core/constants/api_endpoints.dart';
import 'package:data/core/device/local_storage.dart';
import 'package:data/core/mock_api_responses/mock_response_reader.dart';
import 'package:data/core/utils/dio_interceptors/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'token_interceptor_test.mocks.dart';

@GenerateMocks([
  LocalStorage,
  Dio,
  DioError,
  ErrorInterceptorHandler,
  Response,
  RequestOptions,
  Interceptors,
  Lock,
  ApiEndpoints
])
main() {
  late TokenInterceptor tokenInterceptor;
  late MockDio mockDio;
  late MockDio mockTokenDio;
  late MockLocalStorage mockLocalStorage;
  late MockDioError mockDioError;
  late MockErrorInterceptorHandler mockErrorInterceptorHandler;
  late MockResponse<Map<String, dynamic>>? mockResponse;
  late MockRequestOptions mockRequestOptions;
  late MockInterceptors mockInterceptors;
  late MockApiEndpoints mockApiEndpoints;

  group('status code is 401', () {
    setUp(() {
      mockLocalStorage = MockLocalStorage();
      mockDio = MockDio();
      mockTokenDio = MockDio();
      mockDioError = MockDioError();
      mockErrorInterceptorHandler = MockErrorInterceptorHandler();
      mockResponse = MockResponse();
      mockRequestOptions = MockRequestOptions();
      mockApiEndpoints = MockApiEndpoints();
      //mockDioError.response = mockResponse;
      tokenInterceptor = TokenInterceptor(
          mockDio, mockLocalStorage, mockTokenDio, mockApiEndpoints);
      mockInterceptors = MockInterceptors();
    });

    test('should return usertoken from local storage when status code is 401',
        () {
      final String testToken = 'test_token';

      when(mockLocalStorage.getString(userToken)).thenReturn(testToken);
      when(mockResponse!.statusCode).thenReturn(401);
      when(mockResponse!.requestOptions).thenReturn(mockRequestOptions);
      when(mockRequestOptions.headers).thenReturn({});
      when(mockDio.fetch(mockRequestOptions))
          .thenAnswer((realInvocation) => Future.value(mockResponse));

      when(mockDioError.response).thenReturn(mockResponse);

      tokenInterceptor.onError(mockDioError, mockErrorInterceptorHandler);

      verify(mockLocalStorage.getString(userToken));
    });
    test(
        'should retry request when updated token does not match with request\'s token',
        () {
      final String updatedToken = 'updated_token';
      final String oldTokenToken = 'old_token';

      final Map<String, dynamic> oldHeader = ({tokenHeader: oldTokenToken});

      when(mockLocalStorage.getString(userToken)).thenReturn(updatedToken);
      when(mockResponse!.statusCode).thenReturn(401);
      when(mockResponse!.requestOptions).thenReturn(mockRequestOptions);
      when(mockRequestOptions.headers).thenReturn(oldHeader);
      when(mockDio.fetch(mockRequestOptions))
          .thenAnswer((realInvocation) => Future.value(mockResponse));

      when(mockDioError.response).thenReturn(mockResponse);

      tokenInterceptor.onError(mockDioError, mockErrorInterceptorHandler);

      verify(mockLocalStorage.getString(userToken));

      verify(mockDio.fetch(mockRequestOptions));

      expect(mockRequestOptions.headers[tokenHeader], updatedToken);
    });

    group(
        'status code is 401 and updatedToken and request\'s tokens are not same',
        () {
      test('''should get new token from API if 401''', () async {
        final String updatedToken = 'updated_token';
        final String requestsToken = updatedToken;
        final Map<String, dynamic> tokenResponse =
            json.decode(apiResposeMock('token.json'));
        final Map<String, dynamic> header = ({tokenHeader: requestsToken});

        when(mockLocalStorage.getString(userToken)).thenReturn(updatedToken);
        when(mockLocalStorage.saveString(userToken, any))
            .thenAnswer((realInvocation) async => true);
        when(mockResponse!.statusCode).thenReturn(401);
        when(mockResponse!.requestOptions).thenReturn(mockRequestOptions);
        when(mockRequestOptions.headers).thenReturn(header);
        when(mockResponse!.data).thenReturn(tokenResponse);
        when(mockDio.fetch(mockRequestOptions))
            .thenAnswer((realInvocation) async => Future.value(mockResponse));

        when(mockApiEndpoints.token).thenReturn('token');
        when(
          mockTokenDio.get(any),
        ).thenAnswer((realInvocation) async => Future.value(mockResponse));
        when(mockDioError.response).thenReturn(mockResponse);
        when(mockDio.interceptors).thenReturn(mockInterceptors);
        when(mockInterceptors.errorLock).thenReturn(MockLock());
        when(mockInterceptors.responseLock).thenReturn(MockLock());

        tokenInterceptor.onError(mockDioError, mockErrorInterceptorHandler);

        await untilCalled(mockLocalStorage.saveString(userToken, any));
        verify(mockLocalStorage.saveString(userToken, any));
        await untilCalled(verify(mockDio.fetch(mockRequestOptions)));
        verify(mockErrorInterceptorHandler.resolve(mockResponse));
        expect(mockRequestOptions.headers[tokenHeader], tokenResponse['token']);
      });

      test(
          '''should lock further requests untill new token retrieve and should unlock once after''',
          () async {
        final String updatedToken = 'updated_token';
        final String requestsToken = updatedToken;
        final Map<String, dynamic> tokenResponse =
            json.decode(apiResposeMock('token.json'));
        final Map<String, dynamic> header = ({tokenHeader: requestsToken});
        MockLock mockErrorLock = MockLock();
        MockLock mockResponseLock = MockLock();

        when(mockLocalStorage.getString(userToken)).thenReturn(updatedToken);
        when(mockLocalStorage.saveString(userToken, any))
            .thenAnswer((realInvocation) async => true);
        when(mockResponse!.statusCode).thenReturn(401);
        when(mockResponse!.requestOptions).thenReturn(mockRequestOptions);
        when(mockRequestOptions.headers).thenReturn(header);
        when(mockResponse!.data).thenReturn(tokenResponse);
        when(mockDio.fetch(mockRequestOptions))
            .thenAnswer((realInvocation) async => Future.value(mockResponse));
        when(mockApiEndpoints.token).thenReturn('token');

        when(
          mockTokenDio.get(any),
        ).thenAnswer((realInvocation) async => Future.value(mockResponse));
        when(mockDioError.response).thenReturn(mockResponse);
        when(mockDio.interceptors).thenReturn(mockInterceptors);
        when(mockInterceptors.errorLock).thenReturn(mockErrorLock);
        when(mockInterceptors.responseLock).thenReturn(mockResponseLock);

        tokenInterceptor.onError(mockDioError, mockErrorInterceptorHandler);

        await untilCalled(mockDio.lock());
        await untilCalled(mockErrorLock.lock());
        await untilCalled(mockResponseLock.lock());
        verify(mockDio.lock());
        verify(mockErrorLock.lock());
        verify(mockResponseLock.lock());
      });
    });
  });

  test(
      'shoulds continue to call the next error interceptor when status code is not 401',
      () async {
    when(mockResponse!.statusCode).thenReturn(400);

    when(mockDioError.response).thenReturn(mockResponse);

    tokenInterceptor.onError(mockDioError, mockErrorInterceptorHandler);

    await untilCalled(mockErrorInterceptorHandler.next(mockDioError));

    verify(mockErrorInterceptorHandler.next(mockDioError));
  });
}
