import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unknown/src/core/state/test_base_state.dart';
import 'package:unknown/src/feature/experts/domain/repositories/experts_repository.dart';

import '../../data/models/expert_response.dart';

final expertsUseCaseProvider = Provider(
  (ref) {
    return ExpertsUseCase(
      ref.read(expertsRepositoryProvider),
    );
  },
);

class ExpertsUseCase {
  ExpertsUseCase(this._repository);

  final ExpertsRepository _repository;

  Future<DataState<ExpertResponse>> getExpertList() async {
    return await _repository.getExperts();
  }
}
