import 'package:dio/dio.dart';

import 'experts_data_source.dart';

class ExpertsDataSourceImpl implements ExpertsDataSource {
  ExpertsDataSourceImpl({
    required this.client,
  });

  final Dio client;

  @override
  Future<Response> getExperts(int? categoryId) async {
    final queryParameters = {
      'categoryId': '$categoryId',
    };

    final response = await client.get(
      '/v1/experts',
      queryParameters:
          categoryId != null || categoryId == 0 ? queryParameters : null,
    );
    return response;
  }

  @override
  Future<Response> getSingleExpertInfo(int id) async {
    final response = await client.get('/v1/experts/$id');
    return response;
  }

  @override
  Future<Response> getExpertAppointmentTypes(int id) async {
    final response =
        await client.get('/v1/experts/$id/appointment-types');
    return response;
  }

  @override
  Future<Response> getExpertAvailabilities(int id) async {
    final response = await client.get('/v1/experts/$id/availabilities');
    return response;
  }
}
