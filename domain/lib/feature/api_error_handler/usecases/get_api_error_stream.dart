import 'package:core/error/failures.dart';
import 'package:core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/feature/api_error_handler/repositories/api_error_handler_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetApiErrorStream implements UseCase<Stream<Failure>, NoParams> {
  final ApiErrorHandlerRepository apiErrorHandlerRepository;

  GetApiErrorStream(this.apiErrorHandlerRepository);
  @override
  Future<Either<Failure, Stream<Failure>>> call(NoParams params) {
    return Future.value(apiErrorHandlerRepository.getApiErrorStream());
  }
}
