import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:unknown/src/feature/category/domain/use_cases/category_use_case.dart';

import '../../feature/category/data/data_sources/category_data_source.dart';
import '../../feature/category/data/data_sources/category_data_source_imp.dart';
import '../../feature/category/data/repositories/category_repository_imp.dart';
import '../../feature/category/domain/repositories/category_repository.dart';
import '../../feature/experts/data/data_sources/experts_data_source.dart';
import '../../feature/experts/data/data_sources/experts_data_source_imp.dart';
import '../../feature/experts/data/repositories/experts_repository_imp.dart';
import '../../feature/experts/domain/repositories/experts_repository.dart';
import '../../feature/experts/domain/user_case/expert_appointement_use_case.dart';
import '../../feature/experts/domain/user_case/expert_availabilities_use_case.dart';
import '../../feature/experts/domain/user_case/experts_use_case.dart';
import '../../feature/experts/domain/user_case/single_expert_use_case.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio()
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    )
    ..options.baseUrl = "http://192.168.1.12:8080/api"
    ..options.connectTimeout = const Duration(seconds: 5)
    ..options.receiveTimeout = const Duration(seconds: 3);

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<ExpertsDataSource>(
    ExpertsDataSourceImpl(client: locator<Dio>()),
  );

  locator.registerSingleton<CategoryDataSource>(
    CategoryDataSourceImpl(client: locator<Dio>()),
  );

  locator.registerSingleton<ExpertsRepository>(
    ExpertsRepositoryImpl(dataSource: locator<ExpertsDataSource>()),
  );

  locator.registerSingleton<CategoryRepository>(
    CategoryRepositoryImpl(dataSource: locator<CategoryDataSource>()),
  );

  locator.registerSingleton<ExpertsUseCase>(
    ExpertsUseCase(locator<ExpertsRepository>()),
  );

  locator.registerSingleton<ExpertsAppointmentUseCase>(
    ExpertsAppointmentUseCase(locator<ExpertsRepository>()),
  );

  locator.registerSingleton<ExpertsAAvailabilitiesUseCase>(
    ExpertsAAvailabilitiesUseCase(locator<ExpertsRepository>()),
  );

  locator.registerSingleton<CategoryUseCase>(
    CategoryUseCase(locator<CategoryRepository>()),
  );

  locator.registerSingleton<SingleExpertsUseCase>(
    SingleExpertsUseCase(locator<ExpertsRepository>()),
  );
}
