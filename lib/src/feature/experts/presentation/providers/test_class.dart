import 'package:flutter/cupertino.dart';
import 'package:unknown/src/feature/category/data/model/category_model.dart';
import 'package:unknown/src/feature/category/domain/use_cases/category_use_case.dart';
import 'package:unknown/src/feature/experts/data/models/expert_response.dart';
import 'package:unknown/src/feature/experts/domain/user_case/experts_use_case.dart';
import '../../../../core/state/test_base_state.dart';
import '../../data/models/expert_model.dart';
import '../../domain/user_case/single_expert_use_case.dart';

class TestPattern extends ChangeNotifier {
  final ExpertsUseCase expertsUseCase;
  final SingleExpertsUseCase useCase;
  final CategoryUseCase categoryUseCase;

  TestPattern({
    required this.expertsUseCase,
    required this.useCase,
    required this.categoryUseCase,
  });

  DataState<ExpertModel> _apiResponse = DataState.loading(
    'loading',
  );

  DataState<ExpertModel> get apiResponse {
    return _apiResponse;
  }

  Future<void> getSingleExpertInfo(id) async {
    _apiResponse = await useCase.getSingleExpertInfo(id);
    notifyListeners();
  }

  DataState<List<CategoryModel>> _categoriesResponse = DataState.loading(
    'loading',
  );

  DataState<List<CategoryModel>> get categoriesResponse {
    return _categoriesResponse;
  }

  Future<void> getCategoriesList() async {
    _categoriesResponse = await categoryUseCase.categories();
    notifyListeners();
  }

  DataState<ExpertResponse> _expertsResponse = DataState.loading(
    'loading',
  );

  DataState<ExpertResponse> get expertsResponse {
    return _expertsResponse;
  }

  Future<void> getExperts() async {
    _expertsResponse = await expertsUseCase.getExpertList();
    notifyListeners();
  }

}
