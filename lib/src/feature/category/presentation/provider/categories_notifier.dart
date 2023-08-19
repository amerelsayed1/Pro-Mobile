import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:unknown/src/core/state/test_base_state.dart';
import 'package:unknown/src/feature/category/data/model/category_model.dart';

import '../../domain/use_cases/category_use_case.dart';

class CategoriesNotifier extends StateNotifier<DataState> {
  final Ref ref;
  final CategoryUseCase useCase;

  final List<CategoryModel> _categoriesList = [];

  CategoriesNotifier({required this.ref, required this.useCase})
      : super(InitialState());

  Future<void> getCategoriesList() async {
    if (state is DataSuccess) {
      state = LoadingState();
      await Future.delayed(const Duration(milliseconds: 100));

      state = DataSuccess<List<CategoryModel>>(
        data: _categoriesList,
      );
      return;
    }

    state = LoadingState();

    try {
      final result = await useCase.categories();
      log(
        "TEST_Value:" + result.toString(),
      );
      state = result;
    } catch (e, stacktrace) {
      log(
        'ProductsNotifier.productList',
        error: e,
        stackTrace: stacktrace,
      );
      state = DataFailure(error: e.toString());
    }
  }
}
