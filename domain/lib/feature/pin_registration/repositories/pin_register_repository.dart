import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/feature/pin_registration/entities/pin_info.dart';

abstract class PinRegisterRepository {
  Future<Either<Failure, void>> registerPin(PinInfo pin);
}
