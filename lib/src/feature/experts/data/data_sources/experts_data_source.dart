import 'package:dio/dio.dart';

abstract class ExpertsDataSource {
  Future<Response> getExperts(int? categoryId);
  Future<Response> getSingleExpertInfo(int id);
  Future<Response> getExpertAppointmentTypes(int id);
  Future<Response> getExpertAvailabilities(int id);
}
