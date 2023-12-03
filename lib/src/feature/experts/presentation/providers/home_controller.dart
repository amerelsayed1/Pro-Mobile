import 'package:get/get.dart';

import '../../../../core/state/data_state.dart';
import '../../../category/data/model/category_model.dart';
import '../../../category/domain/use_cases/category_use_case.dart';
import '../../../category/domain/use_cases/specialties_use_case.dart';
import '../../data/models/expert_response.dart';
import '../../domain/user_case/experts_use_case.dart';

class HomeController extends GetxController implements GetxService {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final CategoryUseCase categoryUseCase;
  final SpecialtiesUseCase specialtiesUseCase;
  final ExpertsUseCase expertsUseCase;

  HomeController({
    required this.categoryUseCase,
    required this.expertsUseCase,
    required this.specialtiesUseCase,
  });

  DataState<List<CategoryModel>> _categoriesResponse = DataState.loading(
    'loading',
  );

  DataState<List<CategoryModel>> get categoriesResponse {
    return _categoriesResponse;
  }

  Future<DataState<List<CategoryModel>>> getCategoriesList() async {
    _categoriesResponse = await categoryUseCase.categories();
    update();
    return categoriesResponse;
  }

  DataState<ExpertResponse> _expertsResponse = DataState.loading(
    'loading',
  );

  DataState<ExpertResponse> get expertsResponse {
    return _expertsResponse;
  }

  Future<void> getSpecialties(int? id) async {
    _expertsResponse = await expertsUseCase.getExpertList(id);
    update();
  }
}
