import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/feature/app_settings/entities/app_settings.dart';

abstract class AppSettingsRepository {
  Future<Either<Failure, AppSettings>> getAppSettings();
}
