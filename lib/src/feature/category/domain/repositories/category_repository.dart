import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unknown/src/feature/category/data/data_sources/category_data_source.dart';

import '../../../../core/state/test_base_state.dart';
import '../../data/model/category_model.dart';
import '../../data/repositories/category_repository_imp.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>(
  (ref) => CategoryRepositoryImpl(
    dataSource: ref.watch(categoryDataSourceProvider),
  ),
);

abstract class CategoryRepository {
  Future<DataState<List<CategoryModel>>> categories();
}
