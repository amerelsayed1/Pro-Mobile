import '../../../../core/state/data_state.dart';
import '../../domain/repositories/category_repository.dart';
import '../data_sources/category_data_source.dart';
import '../model/category_model.dart';
import '../model/specialties_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({
    required this.dataSource,
  });

  final CategoryDataSource dataSource;

  @override
  Future<List<CategoryModel>> categories() async {
    return dataSource.categories();
  }

  /* @override
  Future<DataState<List<CategoryModel>>> categories() async {

  }*/

  @override
  Future<DataState<List<SpecialtiesModel>>> specialties(int id) async {
    try {
      final response = await dataSource.specialties(id);
      return DataState.completed(_mapSpecialtiesModels(response.data));
    } catch (e, stackTrace) {
      _logError(e, stackTrace);
      return DataState.error(e.toString());
    }
  }

  List<CategoryModel> _mapCategoryModels(List<dynamic> data) {
    return data.map((category) => CategoryModel.fromJson(category)).toList();
  }

  List<SpecialtiesModel> _mapSpecialtiesModels(List<dynamic> data) {
    return data
        .map((specialty) => SpecialtiesModel.fromJson(specialty))
        .toList();
  }

  void _logError(dynamic error, StackTrace stackTrace) {
    // Log the error using a logging library or print statement.
    print('Error: $error\n$stackTrace');
  }
}
