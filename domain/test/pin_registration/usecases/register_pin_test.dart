import 'package:dartz/dartz.dart';
import 'package:domain/feature/pin_registration/entities/pin_info.dart';
import 'package:domain/feature/pin_registration/repositories/pin_register_repository.dart';
import 'package:domain/feature/pin_registration/usecases/register_pin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_pin_test.mocks.dart';

@GenerateMocks([PinRegisterRepository])
main() {
  late RegisterPin registerPin;
  late MockPinRegisterRepository mockPinRegisterRepository;
  setUp(() {
    mockPinRegisterRepository = MockPinRegisterRepository();
    registerPin = RegisterPin(mockPinRegisterRepository);
  });

  test('should call registerPin in repository with the provided pin', () async {
    final pin = '1234';
    RegisterPinParams registerPinParams = RegisterPinParams(pin: pin);
    PinInfo pinInfo = PinInfo(pin);

    when(mockPinRegisterRepository.registerPin(any))
        .thenAnswer((realInvocation) => Future.value(Right(null)));

    var result = await registerPin(registerPinParams);

    expect(result, Right(null));
    verify(mockPinRegisterRepository.registerPin(pinInfo));
  });
}
