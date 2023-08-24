import '../../../../core/state/test_base_state.dart';
import '../../data/model/category_model.dart';
import '../repositories/category_repository.dart';

class CategoryUseCase {
  CategoryUseCase(this._categoryRepository);

  final CategoryRepository _categoryRepository;

  Future<DataState<List<CategoryModel>>> categories() async {
    return await _categoryRepository.categories();
  }
}
