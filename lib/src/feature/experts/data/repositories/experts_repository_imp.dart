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
  Future<DataState<ExpertResponse>> getExperts() async {
    try {
      final response = await dataSource.getExperts();
      List<ExpertModel> list = [];
      /*response.data.forEach(
          (_onBoarding) => list.add(ExpertModel.fromJson(_onBoarding)));*/
      return DataSuccess(data: ExpertResponse.fromJson(response.data));
    } catch (e, stacktrace) {
      /*log(
        'CategoryRepositoryImpl.categories',
        error: e,
        stackTrace: stacktrace,
      );*/
      return DataFailure(error: e.toString());
    }
  }

  @override
  Future<DataState<ExpertModel>> getSingleExpertInfo(int id) async {
    try {
      final response = await dataSource.getSingleExpertInfo(id);
      return DataSuccess(data: ExpertModel.fromJson(response.data));
    } catch (e, stacktrace) {
     /* log(
        'CategoryRepositoryImpl.categories',
        error: e,
        stackTrace: stacktrace,
      );*/
      return DataFailure(error: e.toString());
    }
  }
}
