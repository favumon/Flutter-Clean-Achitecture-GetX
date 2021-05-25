import 'package:core/error/failures.dart';
import 'package:core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/feature/app_settings/entities/app_settings.dart';
import 'package:domain/feature/app_settings/repositories/app_settings_repository.dart';
import 'package:domain/feature/local_storage/repositories/local_storage_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetDefaultLanguage implements UseCase<bool, SetDefaultLanguageParams> {
  final LocalStorageRepository repository;

  SetDefaultLanguage(this.repository);

  @override
  Future<Either<Failure, bool>> call(SetDefaultLanguageParams params) async {
    return await repository.setDefaultLanguage(params);
  }
}

class SetDefaultLanguageParams extends Equatable {
  final String language;

  SetDefaultLanguageParams({required this.language});

  @override
  List<Object> get props => [language];
}
