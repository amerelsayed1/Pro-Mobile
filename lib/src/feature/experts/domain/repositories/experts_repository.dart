import 'package:unknown/src/feature/experts/data/models/expert_model.dart';

import '../../../../core/state/test_base_state.dart';
import '../../data/models/expert_response.dart';

abstract class ExpertsRepository {
  Future<DataState<ExpertResponse>> getExperts();

  Future<DataState<ExpertModel>> getSingleExpertInfo(int id);
}
