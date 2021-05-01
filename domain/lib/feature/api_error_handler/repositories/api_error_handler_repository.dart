import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ApiErrorHandlerRepository {
  Future<Either<Failure, Stream<Failure>>> getApiErrorStream();
}
