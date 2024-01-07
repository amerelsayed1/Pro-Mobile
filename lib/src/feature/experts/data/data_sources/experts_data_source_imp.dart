import 'package:dio/dio.dart';
import 'package:unknown/src/feature/experts/data/models/appointment_types_model.dart';
import 'package:unknown/src/feature/experts/data/models/availabilities/availabilities_model.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';

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
  Future<ExpertModel> getSingleExpertInfo(int id) async {
    try {
      final response = await client.get('/v1/experts/$id');

      if (response.statusCode == 200) {
        return ExpertModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }

  @override
  Future<List<AppointmentTypesModel>> getExpertAppointmentTypes(int id) async {
    try {
      List<AppointmentTypesModel> appointmentTypesList = [];
      final response = await client.get('/v1/experts/$id/appointment-types');
      if (response.statusCode == 200) {
        response.data.forEach(
          (appointment) => appointmentTypesList.add(
            AppointmentTypesModel.fromJson(appointment),
          ),
        );

        return appointmentTypesList;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }

  @override
  Future<List<AvailabilitiesModel>> getExpertAvailabilities(int id) async {
    try {
      List<AvailabilitiesModel> availableSlotsList = [];
      final response = await client.get('/v1/experts/$id/availabilities');
      if (response.statusCode == 200) {
        response.data.forEach((appointment) {
          AvailabilitiesModel slot = AvailabilitiesModel.fromJson(appointment);
          if (slot.slots?.isNotEmpty ?? false) {
            availableSlotsList.add(slot);
          }
        });

        return availableSlotsList;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
