import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:unknown/common/util/constants.dart';
import 'package:unknown/src/feature/auth/data/data_sources/auth_data_source.dart';
import 'package:unknown/src/feature/auth/data/data_sources/auth_data_source_imp.dart';
import 'package:unknown/src/feature/auth/data/repositories/auth_repository_imp.dart';
import 'package:unknown/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:unknown/src/feature/auth/domain/use_case/login_use_case.dart';
import 'package:unknown/src/feature/auth/domain/use_case/register_use_case.dart';

import '../../feature/auth/presentation/providers/auth_controller.dart';
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
import '../../feature/experts/presentation/controllers/home_controller.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  Future<String> getIp() async {
    final NetworkInfo networkInfo = NetworkInfo();
    String? ip = await networkInfo.getWifiIP();
    return ip ?? "";
  }

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
    ..options.baseUrl = Constants.baseApiUrl
    ..options.connectTimeout = const Duration(seconds: 5)
    ..options.receiveTimeout = const Duration(seconds: 5);
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };
  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<ExpertsDataSource>(
    ExpertsDataSourceImpl(client: locator<Dio>()),
  );

  locator.registerSingleton<AuthDataSource>(
    AuthDataSourceImpl(client: locator<Dio>()),
  );

  locator.registerSingleton<CategoryDataSource>(
    CategoryDataSourceImpl(client: locator<Dio>()),
  );

  locator.registerSingleton<ExpertsRepository>(
    ExpertsRepositoryImpl(dataSource: locator<ExpertsDataSource>()),
  );

  locator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(dataSource: locator<AuthDataSource>()),
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

  /* locator.registerSingleton<CategoryUseCase>(
    CategoryUseCase(locator<CategoryRepository>()),
  );

  locator.registerSingleton<SpecialtiesUseCase>(
    SpecialtiesUseCase(locator<CategoryRepository>()),
  );*/

  locator.registerSingleton<SingleExpertsUseCase>(
    SingleExpertsUseCase(locator<ExpertsRepository>()),
  );

  locator.registerSingleton<LoginUseCase>(
    LoginUseCase(locator<AuthRepository>()),
  );

  locator.registerSingleton<RegisterUseCase>(
    RegisterUseCase(locator<AuthRepository>()),
  );

  Get.lazyPut(() => AuthController(
        loginUseCase: locator<LoginUseCase>(),
        registerUseCase: locator<RegisterUseCase>(),
      ));
  Get.lazyPut(
    () => HomeController(
      expertsUseCase: locator<ExpertsUseCase>(),
      categoryRepository: locator<CategoryRepository>(),
      expertsRepository: locator<ExpertsRepository>(),
    ),
  );
}
