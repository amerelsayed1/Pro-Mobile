import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unknown/src/core/state/test_base_state.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';

import '../../domain/user_case/experts_use_case.dart';

class ExpertsNotifier extends StateNotifier<DataState> {
  ExpertsNotifier({
    required this.ref,
    required this.useCase,
  }) : super(InitialState()) {
    /* ref.listen(selectedCategoryProvider, (previous, next) {
      productList(hasFilter: previous != next);
    });*/
  }

  final Ref ref;
  final ExpertsUseCase useCase;

  final List<ExpertModel> _products = [];

  Future<void> productList() async {
    if (state is DataSuccess) {
      // if (category.isNotEmpty) {
      List<ExpertModel> filteredProducts = _products.toList();

      state = LoadingState();
      await Future.delayed(const Duration(milliseconds: 100));

      state = DataSuccess(
        data: filteredProducts.isEmpty ? _products : filteredProducts,
      );
      // }

      return;
    }

    state = LoadingState();
    try {
      final result = await useCase.productList();
      state = result;
    } catch (e, stacktrace) {
      log(
        'ProductsNotifier.productList',
        error: e,
        stackTrace: stacktrace,
      );
      state = DataFailure(error: e as Exception);
    }
  }
}
