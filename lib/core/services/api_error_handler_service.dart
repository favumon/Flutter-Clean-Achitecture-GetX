import 'dart:async';

import 'package:core/error/failures.dart';
import 'package:core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/feature/api_error_handler/usecases/get_api_error_stream.dart';
import 'package:injectable/injectable.dart';
import 'alert_service.dart';

abstract class ApiErrorHandlerService {
  listenForApiError();
  onDispose();
}

@Singleton(as: ApiErrorHandlerService)
class ApiErrorHandlerServiceImpl extends ApiErrorHandlerService {
  final AlertService _alertService;
  final GetApiErrorStream getNetworkStatusStream;
  StreamSubscription<Failure>? apiErrorStreamController;

  ApiErrorHandlerServiceImpl(this._alertService, this.getNetworkStatusStream) {
    listenForApiError();
  }
  @override
  listenForApiError() async {
    Either<Failure, Stream<Failure>> apiErrorStream =
        await getNetworkStatusStream(NoParams());
    apiErrorStream.fold((l) => null, (r) {
      apiErrorStreamController = r.listen((event) {
        if (event is NetworkFailure)
          _alertService.showAlertSnackbar(
              title: "Network issue",
              message: 'Check your network and try again');
      });
    });
  }

  @disposeMethod
  onDispose() {
    apiErrorStreamController?.cancel();
  }
}
