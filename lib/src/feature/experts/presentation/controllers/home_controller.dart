import 'package:get/get.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';

import '../../../../core/state/data_state.dart';
import '../../../category/data/model/category_model.dart';
import '../../../category/domain/repositories/category_repository.dart';
import '../../data/models/appointment_types_model.dart';
import '../../data/models/availabilities/availabilities_model.dart';
import '../../data/models/expert_response.dart';
import '../../domain/repositories/experts_repository.dart';

class HomeController extends GetxController implements GetxService {
  final CategoryRepository categoryRepository;
  final ExpertsRepository expertsRepository;

  HomeController({
    required this.categoryRepository,
    required this.expertsRepository,
  });

  final categoriesState = DataState<List<CategoryModel>>.initial(
    "Initial state",
  ).obs;

  final expertsState = DataState<ExpertResponse>.initial(
    "Initial state",
  ).obs;

  final expertDetailsState = DataState<ExpertModel>.initial(
    "Initial state",
  ).obs;

  final appointmentsState = DataState<List<AppointmentTypesModel>>.initial(
    "Initial state",
  ).obs;

  final availableSlotsState = DataState<List<AvailabilitiesModel>>.initial(
    "Initial state",
  ).obs;

  Future<void> fetchMainHomeData(int? id) async {
    try {
      categoriesState.value = DataState.loading("Loading news");
      expertsState.value = DataState.loading("Loading news");

      final newsData = await categoryRepository.categories();

      newsData.insert(
          0,
          CategoryModel(
            nameEn: "All",
            nameAr: "الكل",
          ));

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

  Future<void> fetchExpertDetails(int id) async {
    try {
      expertDetailsState.value = DataState.loading("Loading news");
      final expertsDetails = await expertsRepository.getSingleExpertInfo(id);
      expertDetailsState.value = DataState.completed(expertsDetails);
    } catch (e) {
      expertDetailsState.value = DataState.error("Error loading experts: $e");
    }
  }

  Future<void> fetchExpertAppointmentTypes(int id) async {
    try {
      appointmentsState.value = DataState.loading("Loading news");
      final expertsDetails = await expertsRepository.getExpertAppointmentTypes(id);
      appointmentsState.value = DataState.completed(expertsDetails);
    } catch (e) {
      appointmentsState.value = DataState.error("Error loading experts: $e");
    }
  }

  Future<void> fetchExpertAvailableSlots(int id) async {
    try {
      availableSlotsState.value = DataState.loading("Loading news");
      final slots = await expertsRepository.getAvailableSlots(id);
      availableSlotsState.value = DataState.completed(slots);
    } catch (e) {
      availableSlotsState.value = DataState.error("Error loading experts: $e");
    }
  }
}
