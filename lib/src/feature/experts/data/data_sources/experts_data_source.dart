import 'package:dio/dio.dart';
import 'package:unknown/src/feature/experts/data/models/expert_response.dart';

import '../models/appointment_types_model.dart';
import '../models/availabilities/availabilities_model.dart';
import '../models/expert_model.dart';

abstract class ExpertsDataSource {
  Future<ExpertResponse> getExperts(int? categoryId);
  Future<ExpertModel> getSingleExpertInfo(int id);
  Future<List<AppointmentTypesModel>> getExpertAppointmentTypes(int id);
  Future<List<AvailabilitiesModel>> getExpertAvailabilities(int id);
}
