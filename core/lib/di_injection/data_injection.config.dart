// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../constants/build_environment.dart' as _i3;

const String _development = 'development';
const String _production = 'production';
const String _developmentNec = 'developmentNec';
const String _productionNec = 'productionNec';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initCoreGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.CurrentEnvironment>(
      () => _i3.CurrentEnvironmentImplDev(),
      registerFor: {_development});
  gh.lazySingleton<_i3.CurrentEnvironment>(
      () => _i3.CurrentEnvironmentImplProd(),
      registerFor: {_production});
  gh.lazySingleton<_i3.CurrentEnvironment>(
      () => _i3.CurrentEnvironmentImplNecDev(),
      registerFor: {_developmentNec});
  gh.lazySingleton<_i3.CurrentEnvironment>(
      () => _i3.CurrentEnvironmentImplNecProd(),
      registerFor: {_productionNec});
  return get;
}
