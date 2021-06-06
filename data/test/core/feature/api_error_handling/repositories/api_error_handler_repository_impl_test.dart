import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:data/core/device/local_storage.dart';
import 'package:data/core/remote_api.dart';
import 'package:data/feature/api_error_handling/repositories/api_error_handler_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_error_handler_repository_impl_test.mocks.dart';

@GenerateMocks([RemoteApiImpl])
main() {
  late RemoteApiImpl remoteApiImpl;

  late ApiErrorHandlerRepositoryImpl apiErrorHandlerRepositoryImpl;

  setUp(() {
    remoteApiImpl = MockRemoteApiImpl();
    apiErrorHandlerRepositoryImpl =
        ApiErrorHandlerRepositoryImpl(remoteApiImpl);
  });
  test('should call networkErrorListner when getApiErrorStream called', () {
    var controller = StreamController<Failure>();

    when(remoteApiImpl.networkErrorListner)
        .thenAnswer((realInvocation) => controller.stream);
    apiErrorHandlerRepositoryImpl.getApiErrorStream();

    verify(remoteApiImpl.networkErrorListner);
    controller.close();
  });
  test('should return Stream<Failure> when getApiErrorStream called', () async {
    var controller = StreamController<Failure>();
    var expectedStream = controller.stream;

    when(remoteApiImpl.networkErrorListner)
        .thenAnswer((realInvocation) => controller.stream);
    var result = await apiErrorHandlerRepositoryImpl.getApiErrorStream();

    expect(result, Right(expectedStream));
    controller.close();
  });
}
