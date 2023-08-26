import 'package:unknown/src/core/state/data_state.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';
import 'package:unknown/src/feature/experts/domain/repositories/experts_repository.dart';


class SingleExpertsUseCase {
  SingleExpertsUseCase(this._repository);

  final ExpertsRepository _repository;

  Future<DataState<ExpertModel>> getSingleExpertInfo(int id) async {
    return await _repository.getSingleExpertInfo(id);
  }
}
