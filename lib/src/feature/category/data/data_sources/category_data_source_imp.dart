import 'package:dio/dio.dart';

import 'category_data_source.dart';

class CategoryDataSourceImpl implements CategoryDataSource {
  CategoryDataSourceImpl({
    required this.client,
  });

  final Dio client;

  @override
  Future<Response> categories() async {
    final response = await client.get(
      '/catalog/v1/categories',
    );
    return response;
  }
}
