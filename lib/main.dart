import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unknown/src/feature/auth/domain/use_case/login_use_case.dart';
import 'package:unknown/src/feature/auth/presentation/providers/auth_provider.dart';
import 'package:unknown/src/feature/category/domain/use_cases/specialties_use_case.dart';
import 'package:unknown/src/feature/experts/domain/user_case/experts_use_case.dart';
import 'package:unknown/src/feature/experts/presentation/providers/test_class.dart';

import 'app.dart';
import 'src/core/di/locator.dart';
import 'src/feature/category/domain/use_cases/category_use_case.dart';
import 'src/feature/experts/domain/user_case/expert_appointement_use_case.dart';
import 'src/feature/experts/domain/user_case/expert_availabilities_use_case.dart';
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
        specialtiesUseCase: locator<SpecialtiesUseCase>(),
        expertsAppointmentUseCase: locator<ExpertsAppointmentUseCase>(),
        expertsAAvailabilitiesUseCase: locator<ExpertsAAvailabilitiesUseCase>(),
      ),
    ),
    ChangeNotifierProvider.value(
      value: AuthProvider(
        loginUseCase: locator<LoginUseCase>(),
      ),
    ),
  ], child: const App()));
}
