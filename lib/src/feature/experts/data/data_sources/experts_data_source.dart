import 'package:dio/dio.dart';
import 'package:unknown/src/feature/experts/data/models/expert_response.dart';

import '../models/expert_model.dart';

abstract class ExpertsDataSource {
  Future<ExpertResponse> getExperts(int? categoryId);
  Future<ExpertModel> getSingleExpertInfo(int id);
  Future<Response> getExpertAppointmentTypes(int id);
  Future<Response> getExpertAvailabilities(int id);
}
