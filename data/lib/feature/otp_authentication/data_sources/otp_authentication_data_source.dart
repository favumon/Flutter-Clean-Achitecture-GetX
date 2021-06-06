import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:data/core/common_api_response_model.dart';
import 'package:data/core/constants/api_endpoints.dart';
import 'package:data/core/remote_api.dart';
import 'package:data/feature/app_settings/models/app_settings_model.dart';
import 'package:data/feature/otp_authentication/models/otp_generation_request_model.dart';
import 'package:data/feature/otp_authentication/models/otp_verification_request_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class OtpAutheticationDataSource {
  final RemoteApi remoteApi;
  final ApiEndpoints apiEndpoints;

  OtpAutheticationDataSource(this.remoteApi, this.apiEndpoints);

  Future<Either<Failure, CommonApiResponseModel>> generateOtp(
      {required OtpGenerationRequestModel request}) async {
    var response = await remoteApi.apiPost(apiEndpoints.generateOtp,
        data: request.toMap());

    return response.fold(
        (l) => Left(l), (r) => Right(CommonApiResponseModel.fromMap(r)));
  }

  Future<Either<Failure, CommonApiResponseModel>> verifyOtp(
      {required OtpVerificationRequestModel request}) async {
    var response =
        await remoteApi.apiPost(apiEndpoints.verifyOtp, data: request.toMap());

    return response.fold(
        (l) => Left(l), (r) => Right(CommonApiResponseModel.fromMap(r)));
  }
}
