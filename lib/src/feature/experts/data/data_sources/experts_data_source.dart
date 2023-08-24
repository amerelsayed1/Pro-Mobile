import 'package:dio/dio.dart';

abstract class ExpertsDataSource {
  Future<Response> getExperts();

  Future<Response> getSingleExpertInfo(int id);
}
