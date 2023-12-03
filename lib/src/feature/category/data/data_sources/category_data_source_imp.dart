import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../model/category_model.dart';
import 'category_data_source.dart';

class CategoryDataSourceImpl implements CategoryDataSource {
  CategoryDataSourceImpl({
    required this.client,
  });

  final Dio client;

  @override
  Future<List<CategoryModel>> categories() async {
    try {
      final response = await client.get(
        '/v1/categories',
      );

      if (response.statusCode == 200) {
        List<CategoryModel> categories = List<CategoryModel>.from(
          response.data.map((x) => CategoryModel.fromJson(x)),
        );
        return categories;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }

  @override
  Future<Response> specialties(int id) async {
    final response = await client.get(
      '/catalog/v1/specialties?categoryId=$id',
    );
    return response;
  }
}
