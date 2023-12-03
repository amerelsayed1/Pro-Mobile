import 'package:unknown/src/feature/experts/data/models/expert_model.dart';

import '../../../../core/state/data_state.dart';
import '../../data/models/appointment_types_model.dart';
import '../../data/models/availabilities/availabilities_model.dart';
import '../../data/models/expert_response.dart';

abstract class ExpertsRepository {
  Future<ExpertResponse> getExperts(int? categoryId);

  Future<ExpertModel> getSingleExpertInfo(int id);

  Future<DataState<List<AppointmentTypesModel>>> getExpertAppointmentTypes(
      int id);

  Future<DataState<List<AvailabilitiesModel>>> getExpertAvailabilities(int id);
}
