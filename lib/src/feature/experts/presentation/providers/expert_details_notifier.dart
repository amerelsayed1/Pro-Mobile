import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unknown/src/core/state/test_base_state.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';

import '../../domain/user_case/experts_use_case.dart';
import '../../domain/user_case/single_expert_use_case.dart';

class ExpertDetailsNotifier extends StateNotifier<DataState> {
  ExpertDetailsNotifier({
    required this.ref,
    required this.useCase,
  }) : super(InitialState()) {
    /* ref.listen(selectedCategoryProvider, (previous, next) {
      productList(hasFilter: previous != next);
    });*/
  }

  final Ref ref;
  final SingleExpertsUseCase useCase;

  //final List<ExpertModel> _products = [];

  Future<void> getSingleExpertInfo(int id) async {
    if (state is DataSuccess) {
      // if (category.isNotEmpty) {
      //ExpertModel expert = _products.toList();

      state = LoadingState();
      await Future.delayed(const Duration(milliseconds: 100));

      state = DataSuccess(
        data: ExpertModel,
      );
      // }

      return;
    }

    state = LoadingState();
    try {
      final result = await useCase.getSingleExpertInfo(id);
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
