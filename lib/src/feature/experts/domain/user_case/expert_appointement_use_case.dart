import 'package:unknown/src/core/state/data_state.dart';
import 'package:unknown/src/feature/experts/data/models/appointment_types_model.dart';
import 'package:unknown/src/feature/experts/domain/repositories/experts_repository.dart';


class ExpertsAppointmentUseCase {
  ExpertsAppointmentUseCase(this._repository);

  final ExpertsRepository _repository;

  Future<DataState<List<AppointmentTypesModel>>> getExpertAppointmentTypes(int id) async {
    return await _repository.getExpertAppointmentTypes(id);
  }
}
