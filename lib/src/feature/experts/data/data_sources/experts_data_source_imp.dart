import 'package:dio/dio.dart';

import 'experts_data_source.dart';

class ExpertsDataSourceImpl implements ExpertsDataSource {
  ExpertsDataSourceImpl({
    required this.client,
  });

  final Dio client;

  @override
  Future<Response> getExperts(int categoryId) async {
    final queryParameters = {
      'categoryId': '$categoryId',
    };

    final response = await client.get(
      '/expert/v1/experts',
      queryParameters: queryParameters,
    );
    return response;
  }

  @override
  Future<Response> getSingleExpertInfo(int id) async {
    final response = await client.get('/expert/v1/experts/$id');
    return response;
  }
}
