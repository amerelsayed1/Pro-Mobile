import 'package:unknown/src/core/state/data_state.dart';
import 'package:unknown/src/feature/auth/data/models/local/login_request.dart';
import 'package:unknown/src/feature/auth/data/models/remote/user_response.dart';
import 'package:unknown/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:unknown/src/feature/experts/data/models/appointment_types_model.dart';
import 'package:unknown/src/feature/experts/domain/repositories/experts_repository.dart';


class LoginUseCase {
  LoginUseCase(this._repository);

  final AuthRepository _repository;

  Future<DataState<UserResponse>> login(LoginRequest loginRequest) async {
    return await _repository.login(loginRequest);
  }
}
