import 'package:unknown/src/feature/category/data/model/specialties_model.dart';

import '../../../../core/state/data_state.dart';
import '../repositories/category_repository.dart';

class SpecialtiesUseCase {
  SpecialtiesUseCase(this._categoryRepository);

  final CategoryRepository _categoryRepository;

  Future<DataState<List<SpecialtiesModel>>> getSpecialties(int id) async {
    return await _categoryRepository.specialties(id);
  }
}
