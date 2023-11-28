import 'package:dio/dio.dart';

abstract class CategoryDataSource {
  Future<Response> categories();
  Future<Response> specialties(int id);
}
