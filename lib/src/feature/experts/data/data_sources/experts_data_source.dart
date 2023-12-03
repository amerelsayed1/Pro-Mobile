import 'package:dio/dio.dart';
import 'package:unknown/src/feature/experts/data/models/expert_response.dart';

abstract class ExpertsDataSource {
  Future<ExpertResponse> getExperts(int? categoryId);
  Future<Response> getSingleExpertInfo(int id);
  Future<Response> getExpertAppointmentTypes(int id);
  Future<Response> getExpertAvailabilities(int id);
}
