import '../../../../core/state/data_state.dart';
import '../../data/model/category_model.dart';
import '../../data/model/specialties_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> categories();

  Future<DataState<List<SpecialtiesModel>>> specialties(int id);
}
