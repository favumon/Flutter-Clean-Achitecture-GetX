import 'package:dartz/dartz.dart';
import 'package:domain/core/common_api_response.dart';
import 'package:domain/feature/otp_verification/entities/otp_generation_request.dart';
import 'package:domain/feature/otp_verification/entities/otp_verification_request.dart';
import 'package:domain/feature/otp_verification/repositories/otp_authentication_repository.dart';
import 'package:domain/feature/otp_verification/usecases/generate_otp.dart';
import 'package:domain/feature/otp_verification/usecases/verify_otp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'generate_otp_test.mocks.dart';

@GenerateMocks([OtpAuthenticationRepository])
main() {
  late GenerateOtp generateOtp;

  late MockOtpAuthenticationRepository mockOtpAuthenticationRepository;

  setUp(() {
    mockOtpAuthenticationRepository = MockOtpAuthenticationRepository();
    generateOtp = GenerateOtp(mockOtpAuthenticationRepository);
  });
  test('should call generateOtp on repository with email and mobile provided',
      () async {
    final email = 'test@test.com';
    final mobileNo = '1234567';

    OtpGenerationRequest request =
        OtpGenerationRequest(email: email, mobileNo: mobileNo);
    CommonApiResponse response = CommonApiResponse();

    GenerateOtpParams params =
        GenerateOtpParams(email: 'test@test.com', mobileNo: '1234567');

    when(mockOtpAuthenticationRepository.generateOtp(
            request: anyNamed('request')))
        .thenAnswer((realInvocation) async => Future.value(Right(response)));

    final result = await generateOtp(params);

    expect(result, Right(response));
    verify(mockOtpAuthenticationRepository.generateOtp(request: request));
    verifyNever(mockOtpAuthenticationRepository.verifyOtp(
        request: anyNamed('request')));
    verifyNoMoreInteractions(mockOtpAuthenticationRepository);
  });
}
