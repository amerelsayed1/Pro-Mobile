import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unknown/src/core/state/test_base_state.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';
import 'package:unknown/src/feature/experts/domain/repositories/experts_repository.dart';

final expertDetailsUseCaseProvider = Provider(
  (ref) {
    return SingleExpertsUseCase(
      ref.read(expertsRepositoryProvider),
    );
  },
);

class SingleExpertsUseCase {
  SingleExpertsUseCase(this._repository);

  final ExpertsRepository _repository;

  Future<DataState<ExpertModel>> getSingleExpertInfo(int id) async {
    return await _repository.getSingleExpertInfo(id);
  }
}
