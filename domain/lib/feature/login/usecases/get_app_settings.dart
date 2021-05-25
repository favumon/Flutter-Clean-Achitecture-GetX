import 'package:core/error/failures.dart';
import 'package:core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/feature/app_settings/entities/app_settings.dart';
import 'package:domain/feature/app_settings/repositories/app_settings_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAppSettings implements UseCase<AppSettings, NoParams> {
  final AppSettingsRepository repository;

  GetAppSettings(this.repository);

  @override
  Future<Either<Failure, AppSettings>> call(NoParams params) async {
    return await repository.getAppSettings();
  }
}
