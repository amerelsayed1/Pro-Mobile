

import '../../../../core/state/test_base_state.dart';
import '../../data/model/category_model.dart';

abstract class CategoryRepository {
  Future<DataState<List<CategoryModel>>> categories();
}
