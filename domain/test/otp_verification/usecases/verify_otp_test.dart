import 'package:dartz/dartz.dart';
import 'package:domain/core/common_api_response.dart';
import 'package:domain/feature/otp_verification/entities/otp_verification_request.dart';
import 'package:domain/feature/otp_verification/repositories/otp_authentication_repository.dart';
import 'package:domain/feature/otp_verification/usecases/verify_otp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'generate_otp_test.mocks.dart';

@GenerateMocks([OtpAuthenticationRepository])
main() {
  late VerifyOtp verifyOtp;

  late MockOtpAuthenticationRepository mockOtpAuthenticationRepository;

  setUp(() {
    mockOtpAuthenticationRepository = MockOtpAuthenticationRepository();
    verifyOtp = VerifyOtp(mockOtpAuthenticationRepository);
  });
  test('should get response for otp verification from repository ', () async {
    String otp = '1234';

    OtpVerificationRequest request = OtpVerificationRequest(otp);
    CommonApiResponse response = CommonApiResponse();

    VerifyOtpParams params = VerifyOtpParams(otp);

    when(mockOtpAuthenticationRepository.verifyOtp(
            request: anyNamed('request')))
        .thenAnswer((realInvocation) async => Future.value(Right(response)));

    final result = await verifyOtp(params);

    expect(result, Right(response));
    verify(mockOtpAuthenticationRepository.verifyOtp(request: request));
    verifyNever(mockOtpAuthenticationRepository.generateOtp(
        request: anyNamed('request')));
    verifyNoMoreInteractions(mockOtpAuthenticationRepository);
  });
}
