import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:data/core/constants/api_endpoints.dart';
import 'package:data/core/remote_api.dart';
import 'package:data/feature/app_settings/models/app_settings_model.dart';
import 'package:domain/feature/app_settings/entities/app_settings.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppSettingsRemoteDataSource {
  final RemoteApi remoteApi;
  final ApiEndpoints apiEndpoints;

  AppSettingsRemoteDataSource(this.remoteApi, this.apiEndpoints);

  Future<Either<Failure, AppSettings>> getAppSettings() async {
    var response = await remoteApi.apiGet(apiEndpoints.appsettings);

    return response.fold(
        (l) => Left(l), (r) => Right(AppSettingsModel.fromMap(r)));
  }
}
