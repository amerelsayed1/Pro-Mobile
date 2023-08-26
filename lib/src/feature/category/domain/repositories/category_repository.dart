

import '../../../../core/state/data_state.dart';
import '../../data/model/category_model.dart';

abstract class CategoryRepository {
  Future<DataState<List<CategoryModel>>> categories();
}
