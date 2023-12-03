import 'package:get/get.dart';

import '../../../../core/state/data_state.dart';
import '../../../category/data/model/category_model.dart';
import '../../../category/domain/repositories/category_repository.dart';
import '../../data/models/expert_response.dart';
import '../../domain/repositories/experts_repository.dart';
import '../../domain/user_case/experts_use_case.dart';

class HomeController extends GetxController implements GetxService {
  final ExpertsUseCase expertsUseCase;
  final CategoryRepository categoryRepository;
  final ExpertsRepository expertsRepository;

  HomeController({
    required this.expertsUseCase,
    required this.categoryRepository,
    required this.expertsRepository,
  });

  final categoriesState =
      DataState<List<CategoryModel>>.initial("Initial state").obs;
  final expertsState = DataState<ExpertResponse>.initial("Initial state").obs;

  Future<void> fetchMainHomeData(int? id) async {
    try {
      categoriesState.value = DataState.loading("Loading news");
      expertsState.value = DataState.loading("Loading news");

      final newsData = await categoryRepository.categories();
      categoriesState.value = DataState.completed(newsData);

      final expertsData = await expertsRepository.getExperts(id);
      expertsState.value = DataState.completed(expertsData);
    } catch (e) {
      categoriesState.value = DataState.error("Error loading news: $e");
      expertsState.value = DataState.error("Error loading experts: $e");
    }
  }

  Future<void> fetchCategories() async {
    try {
      categoriesState.value = DataState.loading("Loading news");
      final newsData = await categoryRepository.categories();
      categoriesState.value = DataState.completed(newsData);
    } catch (e) {
      categoriesState.value = DataState.error("Error loading news: $e");
    }
  }

  Future<void> fetchExperts(int? id) async {
    try {
      expertsState.value = DataState.loading("Loading news");
      final expertsData = await expertsRepository.getExperts(id);
      expertsState.value = DataState.completed(expertsData);
    } catch (e) {
      expertsState.value = DataState.error("Error loading experts: $e");
    }
  }
}
