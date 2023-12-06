import 'package:unknown/src/feature/auth/data/models/local/login_request.dart';
import 'package:unknown/src/feature/auth/data/models/local/register_request.dart';
import 'package:unknown/src/feature/auth/data/models/remote/user_response.dart';

import '../../../../core/state/data_state.dart';

abstract class AuthRepository {
  Future<UserResponse> login(LoginRequest? loginRequest);
  Future<DataState<UserResponse>> loginX(LoginRequest? loginRequest);
  Future<DataState> register(RegisterRequest? registerRequest);
}
