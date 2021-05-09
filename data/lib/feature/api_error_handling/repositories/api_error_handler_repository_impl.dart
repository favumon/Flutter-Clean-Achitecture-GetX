import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:data/core/remote_api.dart';
import 'package:domain/feature/api_error_handler/repositories/api_error_handler_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ApiErrorHandlerRepository)
class ApiErrorHandlerRepositoryImpl extends ApiErrorHandlerRepository {
  final RemoteApi remoteApi;

  ApiErrorHandlerRepositoryImpl(this.remoteApi);

  @override
  Future<Either<Failure, Stream<Failure>>> getApiErrorStream() {
    return Future.value(Right(remoteApi.networkErrorListner));
  }
}
