import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:data/core/local_storage.dart';
import 'package:domain/feature/local_storage/usecases/set_default_language.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocalStorageDataSource {
  final LocalStorage _localStorage;

  LocalStorageDataSource(this._localStorage);
  Future<Either<Failure, String>> getDefaultLanguage() {
    var lang = _localStorage.getString(defaultLanguage);

    return lang != null
        ? Future.value(Right(lang))
        : Future.value(Left(LocalStorageFailure()));
  }

  @override
  Future<Either<Failure, bool>> setDefaultLanguage(
      SetDefaultLanguageParams params) async {
    var status =
        await _localStorage.saveString(defaultLanguage, params.language);
    return status ? Right(status) : Left(LocalStorageFailure());
  }
}
