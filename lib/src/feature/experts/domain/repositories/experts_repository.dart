import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unknown/src/feature/experts/data/data_sources/experts_data_source.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';

import '../../../../core/state/test_base_state.dart';
import '../../data/models/expert_response.dart';
import '../../data/repositories/experts_repository_imp.dart';

final expertsRepositoryProvider = Provider<ExpertsRepository>(
  (ref) => ExpertsRepositoryImpl(
    dataSource: ref.watch(expertsDataSourceProvider),
  ),
);

abstract class ExpertsRepository {
  Future<DataState<ExpertResponse>> getExperts();
  Future<DataState<ExpertModel>> getSingleExpertInfo(int id);
}
