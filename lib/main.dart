import 'package:flutter/material.dart';

import 'app.dart';
import 'src/core/di/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const App());
}
