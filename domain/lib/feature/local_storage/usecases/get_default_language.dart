import 'package:core/error/failures.dart';
import 'package:core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/feature/app_settings/entities/app_settings.dart';
import 'package:domain/feature/app_settings/repositories/app_settings_repository.dart';
import 'package:domain/feature/local_storage/repositories/local_storage_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetDefaultLanguage implements UseCase<String, NoParams> {
  final LocalStorageRepository repository;

  GetDefaultLanguage(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repository.getDefaultLanguage();
  }
}
