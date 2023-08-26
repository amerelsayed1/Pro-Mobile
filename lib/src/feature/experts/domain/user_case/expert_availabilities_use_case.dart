import 'package:unknown/src/core/state/data_state.dart';
import 'package:unknown/src/feature/experts/data/models/appointment_types_model.dart';
import 'package:unknown/src/feature/experts/domain/repositories/experts_repository.dart';

import '../../data/models/availabilities/availabilities_model.dart';


class ExpertsAAvailabilitiesUseCase {
  ExpertsAAvailabilitiesUseCase(this._repository);

  final ExpertsRepository _repository;

  Future<DataState<List<AvailabilitiesModel>>> getExpertAvailabilities(int id) async {
    return await _repository.getExpertAvailabilities(id);
  }
}
