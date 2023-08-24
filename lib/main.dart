import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unknown/src/feature/experts/domain/user_case/experts_use_case.dart';
import 'package:unknown/src/feature/experts/presentation/providers/test_class.dart';

import 'app.dart';
import 'src/core/di/locator.dart';
import 'src/feature/category/domain/use_cases/category_use_case.dart';
import 'src/feature/experts/domain/user_case/single_expert_use_case.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: TestPattern(
        useCase: locator<SingleExpertsUseCase>(),
        expertsUseCase: locator<ExpertsUseCase>(),
        categoryUseCase: locator<CategoryUseCase>(),
      ),
    ),
  ], child: const App()));
}
