import 'package:core/constants/build_environment.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'theme.dart';

@Injectable(
    as: Apptheme,
    env: [BuildEnvironment.developmentNec, BuildEnvironment.productionNec])
class AppThemeNecImpl extends Apptheme {
  get theme =>
      ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark);
}
