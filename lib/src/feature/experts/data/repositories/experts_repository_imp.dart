import 'package:unknown/src/core/state/data_state.dart';
import 'package:unknown/src/feature/experts/data/data_sources/experts_data_source.dart';
import 'package:unknown/src/feature/experts/data/models/appointment_types_model.dart';
import 'package:unknown/src/feature/experts/data/models/availabilities/availabilities_model.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';

import '../../domain/repositories/experts_repository.dart';
import '../models/expert_response.dart';

class ExpertsRepositoryImpl implements ExpertsRepository {
  ExpertsRepositoryImpl({
    required this.dataSource,
  });

  final ExpertsDataSource dataSource;

  @override
  Future<ExpertResponse> getExperts(int? categoryId) async {
    return dataSource.getExperts(categoryId);
  }

  @override
  Future<ExpertModel> getSingleExpertInfo(int id) async {
    return dataSource.getSingleExpertInfo(id);
  }

  @override
  Future<DataState<List<AppointmentTypesModel>>> getExpertAppointmentTypes(
    int id,
  ) async {
    DataState<List<AppointmentTypesModel>> apiResponse = DataState.loading(
      'Fetching ExpertAppointment data',
    );
    try {
      List<AppointmentTypesModel> appointments = [];
      final response = await dataSource.getExpertAppointmentTypes(id);
      response.data.forEach(
        (appointment) => appointments.add(
          AppointmentTypesModel.fromJson(appointment),
        ),
      );
      apiResponse = DataState.completed(appointments);
      return apiResponse;
    } catch (e) {
      apiResponse = DataState.error(e.toString());
      return apiResponse;
    }
  }

  @override
  Future<DataState<List<AvailabilitiesModel>>> getExpertAvailabilities(
      int id) async {
    DataState<List<AvailabilitiesModel>> apiResponse = DataState.loading(
      'Fetching ExpertAppointment data',
    );
    try {
      List<AvailabilitiesModel> appointments = [];
      final response = await dataSource.getExpertAvailabilities(id);
      response.data.forEach(
        (appointment) => appointments.add(
          AvailabilitiesModel.fromJson(appointment),
        ),
      );
      apiResponse = DataState.completed(appointments);
      return apiResponse;
    } catch (e) {
      apiResponse = DataState.error(e.toString());
      return apiResponse;
    }
  }
}
