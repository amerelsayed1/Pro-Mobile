import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/util/constants.dart';
import '../../feature/auth/data/data_sources/auth_data_source.dart';
import '../../feature/auth/data/data_sources/auth_data_source_imp.dart';
import '../../feature/auth/data/repositories/auth_repository_imp.dart';
import '../../feature/auth/domain/repositories/auth_repository.dart';
import '../../feature/auth/domain/use_case/register_use_case.dart';
import '../../feature/auth/presentation/controller/auth_controller.dart';
import '../../feature/category/data/data_sources/category_data_source.dart';
import '../../feature/category/data/data_sources/category_data_source_imp.dart';
import '../../feature/category/data/repositories/category_repository_imp.dart';
import '../../feature/category/domain/repositories/category_repository.dart';
import '../../feature/experts/data/data_sources/experts_data_source.dart';
import '../../feature/experts/data/data_sources/experts_data_source_imp.dart';
import '../../feature/experts/data/repositories/experts_repository_imp.dart';
import '../../feature/experts/domain/repositories/experts_repository.dart';
import '../../feature/experts/domain/user_case/experts_use_case.dart';
import '../../feature/experts/presentation/controllers/home_controller.dart';

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
    ..options.baseUrl = Constants.baseApiUrl
    ..options.connectTimeout = const Duration(seconds: 60)
    ..options.receiveTimeout = const Duration(seconds: 60);
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };
  locator.registerSingleton<Dio>(dio);

  final sharedPreferences = await SharedPreferences.getInstance();
  //Get.lazyPut(() => sharedPreferences);
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

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
    AuthRepositoryImpl(
      dataSource: locator<AuthDataSource>(),
      sharedPreferences: locator<SharedPreferences>(),
    ),
  );

  locator.registerSingleton<CategoryRepository>(
    CategoryRepositoryImpl(dataSource: locator<CategoryDataSource>()),
  );

  locator.registerSingleton<ExpertsUseCase>(
    ExpertsUseCase(locator<ExpertsRepository>()),
  );

  locator.registerSingleton<RegisterUseCase>(
    RegisterUseCase(locator<AuthRepository>()),
  );

  Get.lazyPut(() => AuthController(authRepository: locator<AuthRepository>()));
  Get.lazyPut(
    () => HomeController(
      categoryRepository: locator<CategoryRepository>(),
      expertsRepository: locator<ExpertsRepository>(),
    ),
  );
}
