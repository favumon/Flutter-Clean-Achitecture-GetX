import 'package:dartz/dartz.dart';
import 'package:domain/feature/signup/entities/signup_info.dart';
import 'package:domain/feature/signup/entities/signup_response.dart';
import 'package:domain/feature/signup/repositories/user_signup_repository.dart';
import 'package:domain/feature/signup/usecases/submit_signup_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'submit_signup_info_test.mocks.dart';

@GenerateMocks([UserSignupRepository])
main() {
  late SubmitSignupInfo submitSignupInfo;
  late MockUserSignupRepository mockUserSignupRepository;

  setUp(() {
    mockUserSignupRepository = MockUserSignupRepository();
    submitSignupInfo = SubmitSignupInfo(mockUserSignupRepository);
  });
  test('should get Signup response for Singnup data, otp from repository ',
      () async {
    SignupInfo signupInfo = SignupInfo(name: 'name');
    String otp = '1234';
    SignupResponse signupResponse = SignupResponse();

    SignupRequestParams params = SignupRequestParams(signupInfo, otp);

    when(mockUserSignupRepository.submitSignupInfo(
            signupInfo: anyNamed('signupInfo'), otp: anyNamed('otp')))
        .thenAnswer(
            (realInvocation) async => Future.value(Right(signupResponse)));

    final result = await submitSignupInfo(params);

    expect(result, Right(signupResponse));
    verify(mockUserSignupRepository.submitSignupInfo(
        signupInfo: signupInfo, otp: otp));
    verifyNoMoreInteractions(mockUserSignupRepository);
  });
}
