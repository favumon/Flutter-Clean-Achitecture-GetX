import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:data/core/device/local_storage.dart';
import 'package:domain/feature/app_settings/entities/app_settings.dart';
import 'package:domain/feature/local_storage/repositories/local_storage_repository.dart';
import 'package:domain/feature/local_storage/usecases/set_default_language.dart';
import 'package:injectable/injectable.dart';

import 'data_source/local_storage_data_source.dart';

@LazySingleton(as: LocalStorageRepository)
class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDataSource localStorageDataSource;

  LocalStorageRepositoryImpl(this.localStorageDataSource);

  Future<Either<Failure, String>> getDefaultLanguage() async {
    return await localStorageDataSource.getDefaultLanguage();
  }

  @override
  Future<Either<Failure, bool>> setDefaultLanguage(
      SetDefaultLanguageParams params) async {
    return await localStorageDataSource.setDefaultLanguage(params);
  }
}
