import 'package:dio/dio.dart';

abstract class ExpertsDataSource {
  Future<Response> getExperts(int categoryId);

  Future<Response> getSingleExpertInfo(int id);
}
