// Mocks generated by Mockito 5.0.7 from annotations
// in symex_mobile_v2/test/feature/language_selection/language_selection_page_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:core/error/failures.dart' as _i7;
import 'package:dartz/dartz.dart' as _i3;
import 'package:domain/feature/app_settings/entities/app_settings.dart' as _i10;
import 'package:domain/feature/local_storage/repositories/local_storage_repository.dart'
    as _i2;
import 'package:domain/feature/local_storage/usecases/set_default_language.dart'
    as _i5;
import 'package:flutter/src/widgets/navigator.dart' as _i9;
import 'package:get/get_core/src/get_interface.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:symex_mobile_v2/core/services/navigation_service.dart' as _i8;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeLocalStorageRepository extends _i1.Fake
    implements _i2.LocalStorageRepository {}

class _FakeEither<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

class _FakeGetInterface extends _i1.Fake implements _i4.GetInterface {}

/// A class which mocks [SetDefaultLanguage].
///
/// See the documentation for Mockito's code generation for more information.
class MockSetDefaultLanguage extends _i1.Mock
    implements _i5.SetDefaultLanguage {
  MockSetDefaultLanguage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.LocalStorageRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
              returnValue: _FakeLocalStorageRepository())
          as _i2.LocalStorageRepository);
  @override
  _i6.Future<_i3.Either<_i7.Failure, bool>> call(
          _i5.SetDefaultLanguageParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i3.Either<_i7.Failure, bool>>.value(
                  _FakeEither<_i7.Failure, bool>()))
          as _i6.Future<_i3.Either<_i7.Failure, bool>>);
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i8.NavigationService {
  MockNavigationService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.GetInterface get get => (super.noSuchMethod(Invocation.getter(#get),
      returnValue: _FakeGetInterface()) as _i4.GetInterface);
  @override
  void navigate(String? route, {dynamic arguments}) => super.noSuchMethod(
      Invocation.method(#navigate, [route], {#arguments: arguments}),
      returnValueForMissingStub: null);
  @override
  void navigateAndReplace(String? route) =>
      super.noSuchMethod(Invocation.method(#navigateAndReplace, [route]),
          returnValueForMissingStub: null);
  @override
  void navigateBackUntil(String? route) =>
      super.noSuchMethod(Invocation.method(#navigateBackUntil, [route]),
          returnValueForMissingStub: null);
  @override
  void navigateAndClearStackUntil(String? route,
          {bool Function(_i9.Route<dynamic>)? predicate}) =>
      super.noSuchMethod(
          Invocation.method(
              #navigateAndClearStackUntil, [route], {#predicate: predicate}),
          returnValueForMissingStub: null);
  @override
  void navigateBack() =>
      super.noSuchMethod(Invocation.method(#navigateBack, []),
          returnValueForMissingStub: null);
}

/// A class which mocks [AppSettings].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppSettings extends _i1.Mock implements _i10.AppSettings {
  MockAppSettings() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get iosVersion =>
      (super.noSuchMethod(Invocation.getter(#iosVersion), returnValue: '')
          as String);
  @override
  set iosVersion(String? _iosVersion) =>
      super.noSuchMethod(Invocation.setter(#iosVersion, _iosVersion),
          returnValueForMissingStub: null);
  @override
  String get androidVersion =>
      (super.noSuchMethod(Invocation.getter(#androidVersion), returnValue: '')
          as String);
  @override
  set androidVersion(String? _androidVersion) =>
      super.noSuchMethod(Invocation.setter(#androidVersion, _androidVersion),
          returnValueForMissingStub: null);
}
