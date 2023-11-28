import 'package:flutter/cupertino.dart';
import 'package:unknown/src/feature/category/data/model/category_model.dart';
import 'package:unknown/src/feature/category/data/model/specialties_model.dart';
import 'package:unknown/src/feature/category/domain/use_cases/category_use_case.dart';
import 'package:unknown/src/feature/category/domain/use_cases/specialties_use_case.dart';
import 'package:unknown/src/feature/experts/data/models/appointment_types_model.dart';
import 'package:unknown/src/feature/experts/data/models/expert_response.dart';
import 'package:unknown/src/feature/experts/domain/user_case/experts_use_case.dart';
import '../../../../core/state/data_state.dart';
import '../../data/models/availabilities/availabilities_model.dart';
import '../../data/models/expert_model.dart';
import '../../domain/user_case/expert_appointement_use_case.dart';
import '../../domain/user_case/expert_availabilities_use_case.dart';
import '../../domain/user_case/single_expert_use_case.dart';

class TestPattern extends ChangeNotifier {
  final ExpertsUseCase expertsUseCase;
  final SingleExpertsUseCase useCase;
  final CategoryUseCase categoryUseCase;
  final SpecialtiesUseCase specialtiesUseCase;
  final ExpertsAppointmentUseCase expertsAppointmentUseCase;
  final ExpertsAAvailabilitiesUseCase expertsAAvailabilitiesUseCase;

  TestPattern({
    required this.expertsUseCase,
    required this.useCase,
    required this.categoryUseCase,
    required this.specialtiesUseCase,
    required this.expertsAppointmentUseCase,
    required this.expertsAAvailabilitiesUseCase,
  });

  DataState<ExpertModel> _apiResponse = DataState.loading(
    'loading',
  );

  DataState<ExpertModel> get apiResponse {
    return _apiResponse;
  }

  Future<void> getSingleExpertInfo(id) async {
    _apiResponse = await useCase.getSingleExpertInfo(id);
    notifyListeners();
  }




  DataState<List<CategoryModel>> _categoriesResponse = DataState.loading(
    'loading',
  );

  DataState<List<CategoryModel>> get categoriesResponse {
    return _categoriesResponse;
  }

  Future<DataState<List<CategoryModel>>> getCategoriesList() async {
    _categoriesResponse = await categoryUseCase.categories();
    notifyListeners();
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
    notifyListeners();
  }








  DataState<ExpertResponse> _expertsResponse = DataState.loading(
    'loading',
  );

  DataState<ExpertResponse> get expertsResponse {
    return _expertsResponse;
  }

  Future<void> getExperts(int? categoryId) async {
    _expertsResponse = await expertsUseCase.getExpertList(categoryId);
    notifyListeners();
  }

  DataState<List<AppointmentTypesModel>> _appointmentsResponse =
      DataState.loading(
    'loading',
  );

  DataState<List<AppointmentTypesModel>> get appointmentsResponse {
    return _appointmentsResponse;
  }

  Future<DataState<List<AppointmentTypesModel>>> getExpertAppointment(
      int categoryId) async {
    _appointmentsResponse =
        await expertsAppointmentUseCase.getExpertAppointmentTypes(categoryId);
    notifyListeners();
    return appointmentsResponse;
  }

  DataState<List<AvailabilitiesModel>> _availabilitiesResponse =
      DataState.loading(
    'loading',
  );

  DataState<List<AvailabilitiesModel>> get availabilitiesResponse {
    return _availabilitiesResponse;
  }

  Future<void> getExpertAvailabilities(int categoryId) async {
    _availabilitiesResponse =
        await expertsAAvailabilitiesUseCase.getExpertAvailabilities(categoryId);
    notifyListeners();
  }
}
