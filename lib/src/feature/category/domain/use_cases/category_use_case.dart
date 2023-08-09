import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unknown/src/core/state/test_base_state.dart';

import '../../data/model/category_model.dart';
import '../repositories/category_repository.dart';

final categoryUseCaseProvider = Provider<CategoryUseCase>(
  (ref) => CategoryUseCase(
    ref.watch(categoryRepositoryProvider),
  ),
);

class CategoryUseCase {
  CategoryUseCase(this._categoryRepository);

  final CategoryRepository _categoryRepository;

  Future<DataState<List<CategoryModel>>> categories() async {
    return await _categoryRepository.categories();
  }
}
