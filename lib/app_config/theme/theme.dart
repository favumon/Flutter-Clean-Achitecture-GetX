import 'package:core/constants/build_environment.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class Apptheme {
  MaterialColor colorPrimary = const MaterialColor(0xFF23264d, const {
    50: const Color(0xFFe8eaf0),
    100: const Color(0xFFc3c9da),
    200: const Color(0xFF9da6c1),
    300: const Color(0xFF7983a7),
    400: const Color(0xFF5e6995),
    500: const Color(0xFF435086),
    600: const Color(0xFF3d497d),
    700: const Color(0xFF354072),
    800: const Color(0xFF2e3665),
    900: const Color(0xFF23264d)
  });

  get theme => ThemeData(
      primarySwatch: colorPrimary,
      fontFamily: 'Nexa',
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.green, fontSize: 77),
        bodyText2: TextStyle(color: Colors.cyanAccent, fontSize: 12), //Text
        button: TextStyle(color: Colors.deepOrange),
        headline1: TextStyle(fontSize: 38),
        headline2: TextStyle(fontSize: 25),
        headline3: TextStyle(fontSize: 20),
        headline4: TextStyle(fontSize: 17),
        headline5: TextStyle(fontSize: 16),
        headline6: TextStyle(fontSize: 14),
        overline: TextStyle(fontSize: 90, color: Colors.lightGreenAccent),
        subtitle1: TextStyle(fontSize: 16), //Textfield
        subtitle2: TextStyle(fontSize: 88),
      ),
      primaryColor: colorPrimary);
}

//can be generated from https://materialpalettes.com/

@Injectable(
    as: Apptheme,
    env: [BuildEnvironment.development, BuildEnvironment.production])
class AppThemeImpl extends Apptheme {
  @override
  MaterialColor colorPrimary = const MaterialColor(0xFF008d00, const {
    50: const Color(0xFFecfeea),
    100: const Color(0xFFcefcca),
    200: const Color(0xFFacfaa7),
    300: const Color(0xFF82f680),
    400: const Color(0xFF57f25e),
    500: const Color(0xFF02ee39),
    600: const Color(0xFF00dc31),
    700: const Color(0xFF00c626),
    800: const Color(0xFF00b119),
    900: const Color(0xFF008d00)
  });
}
