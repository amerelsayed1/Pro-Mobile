import 'dart:io';

import 'package:dio/dio.dart';
import 'package:unknown/src/feature/category/data/model/category_model.dart';

import '../../../../core/state/test_base_state.dart';
import '../../domain/repositories/category_repository.dart';
import '../data_sources/category_data_source.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({
    required this.dataSource,
  });

  final CategoryDataSource dataSource;

  @override
  Future<DataState<List<CategoryModel>>> categories() async {
    try {
      final response = await dataSource.categories();
      if (response.statusCode == HttpStatus.ok) {
        List<CategoryModel> list = [];
        response.data.forEach(
            (_onBoarding) => list.add(CategoryModel.fromJson(_onBoarding)));
        return DataSuccess(data: list);
      } else {
        throw DioException(
          response: response,
          requestOptions: response.requestOptions,
        );
      }
    } on DioException catch (error) {
      return DataFailure(error: error);
    }

    /* try {
      final response = await dataSource.categories();
      List<CategoryModel> list = [];
      response.data.forEach(
          (_onBoarding) => list.add(CategoryModel.fromJson(_onBoarding)));
      return Right(list);
    } catch (e, stacktrace) {
      log(
        'CategoryRepositoryImpl.categories',
        error: e,
        stackTrace: stacktrace,
      );
      return Left(e as Exception);
    }*/
  }
}
