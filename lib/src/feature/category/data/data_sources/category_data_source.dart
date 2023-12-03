import 'package:dio/dio.dart';
import 'package:unknown/src/feature/category/data/model/category_model.dart';

abstract class CategoryDataSource {
  Future<List<CategoryModel>> categories();
  Future<Response> specialties(int id);
}
