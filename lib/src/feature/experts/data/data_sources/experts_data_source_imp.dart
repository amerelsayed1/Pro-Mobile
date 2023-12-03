import 'package:dio/dio.dart';

import '../models/expert_response.dart';
import 'experts_data_source.dart';

class ExpertsDataSourceImpl implements ExpertsDataSource {
  ExpertsDataSourceImpl({
    required this.client,
  });

  final Dio client;

  @override
  Future<ExpertResponse> getExperts(int? categoryId) async {
    try {
      final queryParameters = {
        'categoryId': '$categoryId',
      };

      final response = await client.get(
        '/v1/experts',
        queryParameters:
            categoryId != null || categoryId == 0 ? queryParameters : null,
      );

      if (response.statusCode == 200) {
        return ExpertResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }

  @override
  Future<Response> getSingleExpertInfo(int id) async {
    final response = await client.get('/v1/experts/$id');
    return response;
  }

  @override
  Future<Response> getExpertAppointmentTypes(int id) async {
    final response = await client.get('/v1/experts/$id/appointment-types');
    return response;
  }

  @override
  Future<Response> getExpertAvailabilities(int id) async {
    final response = await client.get('/v1/experts/$id/availabilities');
    return response;
  }
}
