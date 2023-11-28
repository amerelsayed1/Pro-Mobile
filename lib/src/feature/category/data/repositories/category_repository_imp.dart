import 'package:flutter/cupertino.dart';
import 'package:unknown/src/feature/category/data/model/category_model.dart';
import 'package:unknown/src/feature/category/data/model/specialties_model.dart';

import '../../../../core/state/data_state.dart';
import '../../domain/repositories/category_repository.dart';
import '../data_sources/category_data_source.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({
    required this.dataSource,
  });

  final CategoryDataSource dataSource;

  @override
  Future<DataState<List<CategoryModel>>> categories() async {
    DataState<List<CategoryModel>> apiResponse = DataState.loading(
      'Loading',
    );
    try {
      final response = await dataSource.categories();

      List<CategoryModel> list = [];
      response.data.forEach(
        (category) => list.add(
          CategoryModel.fromJson(category),
        ),
      );

      apiResponse = DataState.completed(
        list,
      );
      return apiResponse;
    } catch (e) {
      apiResponse = DataState.error(e.toString());
      return apiResponse;
    }
  }

  @override
  Future<DataState<List<SpecialtiesModel>>> specialties(int id) async {
    DataState<List<SpecialtiesModel>> apiResponse = DataState.loading(
      'loading',
    );
    try {
      final response = await dataSource.specialties(id);
      List<SpecialtiesModel> list = [];
      response.data.forEach(
        (category) => list.add(
          SpecialtiesModel.fromJson(category),
        ),
      );

      apiResponse = DataState.completed(list);
      return apiResponse;
    } catch (e) {
      apiResponse = DataState.error(e.toString());
      return apiResponse;
    }
  }
}
