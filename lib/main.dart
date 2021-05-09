import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'di_injection/injection_container.dart';
import 'material_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(environment: Environment.test);
  runApp(MaterialWidget());
}
