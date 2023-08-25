import 'dart:developer';

import 'package:unknown/src/core/state/test_base_state.dart';
import 'package:unknown/src/feature/experts/data/data_sources/experts_data_source.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';

import '../../domain/repositories/experts_repository.dart';
import '../models/expert_response.dart';

class ExpertsRepositoryImpl implements ExpertsRepository {
  ExpertsRepositoryImpl({
    required this.dataSource,
  });

  final ExpertsDataSource dataSource;

  @override
  Future<DataState<ExpertResponse>> getExperts(int categoryId) async {
    DataState<ExpertResponse> apiResponse = DataState.loading(
      'loading',
    );
    try {
      final response = await dataSource.getExperts(categoryId);
      apiResponse = DataState.completed(ExpertResponse.fromJson(response.data));
      return apiResponse;
    } catch (e) {
      apiResponse = DataState.error(e.toString());
      return apiResponse;
    }
  }

  @override
  Future<DataState<ExpertModel>> getSingleExpertInfo(int id) async {
    DataState<ExpertModel> apiResponse = DataState.loading(
      'Fetching artist data',
    );
    try {
      final response = await dataSource.getSingleExpertInfo(id);
      apiResponse = DataState.completed(
        ExpertModel.fromJson(response.data),
      );
      return apiResponse;
    } catch (e) {
      apiResponse = DataState.error(e.toString());
      return apiResponse;
    }
  }
}
