import 'package:unknown/src/core/state/data_state.dart';
import 'package:unknown/src/feature/experts/domain/repositories/experts_repository.dart';

import '../../data/models/expert_response.dart';

class ExpertsUseCase {
  final ExpertsRepository _repository;

  ExpertsUseCase(this._repository);

  /*Future<DataState<ExpertResponse>> getExpertList(int? categoryId) async {
    return await _repository.getExperts(categoryId);
  }*/
}
