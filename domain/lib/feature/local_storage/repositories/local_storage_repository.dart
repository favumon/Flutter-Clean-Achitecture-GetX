import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/feature/app_settings/entities/app_settings.dart';
import 'package:domain/feature/local_storage/usecases/set_default_language.dart';

abstract class LocalStorageRepository {
  Future<Either<Failure, String>> getDefaultLanguage();
  Future<Either<Failure, bool>> setDefaultLanguage(
      SetDefaultLanguageParams params);
}
