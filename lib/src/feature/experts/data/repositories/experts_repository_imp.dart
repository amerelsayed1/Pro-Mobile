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
  Future<List<AppointmentTypesModel>> getExpertAppointmentTypes(int id) {
    return dataSource.getExpertAppointmentTypes(id);
  }

  @override
  Future<List<AvailabilitiesModel>> getAvailableSlots(int id) {
    return dataSource.getExpertAvailabilities(id);
  }

}
