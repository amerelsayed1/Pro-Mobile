import 'package:get/get.dart';

import '../../../../core/state/data_state.dart';
import '../../../category/data/model/category_model.dart';
import '../../../category/data/model/specialties_model.dart';
import '../../../category/domain/use_cases/category_use_case.dart';
import '../../../category/domain/use_cases/specialties_use_case.dart';

class HomeController extends GetxController implements GetxService {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final CategoryUseCase categoryUseCase;
  final SpecialtiesUseCase specialtiesUseCase;

  HomeController({
    required this.categoryUseCase,
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

  DataState<List<SpecialtiesModel>> _specialtiesResponse = DataState.loading(
    'loading',
  );

  DataState<List<SpecialtiesModel>> get specialtiesResponse {
    return _specialtiesResponse;
  }

  Future<void> getSpecialties(int id) async {
    _specialtiesResponse = await specialtiesUseCase.getSpecialties(id);
    update();
  }
}
