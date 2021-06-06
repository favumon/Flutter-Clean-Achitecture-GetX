// Mocks generated by Mockito 5.0.7 from annotations
// in domain/test/otp_verification/usecases/generate_otp_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:core/error/failures.dart' as _i5;
import 'package:dartz/dartz.dart' as _i2;
import 'package:domain/core/common_api_response.dart' as _i6;
import 'package:domain/feature/otp_verification/entities/otp_generation_request.dart'
    as _i7;
import 'package:domain/feature/otp_verification/entities/otp_verification_request.dart'
    as _i8;
import 'package:domain/feature/otp_verification/repositories/otp_authentication_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [OtpAuthenticationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockOtpAuthenticationRepository extends _i1.Mock
    implements _i3.OtpAuthenticationRepository {
  MockOtpAuthenticationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.CommonApiResponse>> generateOtp(
          {_i7.OtpGenerationRequest? request}) =>
      (super.noSuchMethod(
              Invocation.method(#generateOtp, [], {#request: request}),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i6.CommonApiResponse>>.value(
                      _FakeEither<_i5.Failure, _i6.CommonApiResponse>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.CommonApiResponse>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.CommonApiResponse>> verifyOtp(
          {_i8.OtpVerificationRequest? request}) =>
      (super.noSuchMethod(
              Invocation.method(#verifyOtp, [], {#request: request}),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i6.CommonApiResponse>>.value(
                      _FakeEither<_i5.Failure, _i6.CommonApiResponse>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.CommonApiResponse>>);
}
