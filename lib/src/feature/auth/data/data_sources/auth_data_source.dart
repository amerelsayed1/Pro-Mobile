
import 'package:unknown/src/core/state/data_state.dart';
import 'package:unknown/src/feature/auth/data/models/local/register_request.dart';
import 'package:unknown/src/feature/auth/data/models/remote/user_response.dart';

import '../models/local/login_request.dart';

abstract class AuthDataSource {
  Future<UserResponse> login(LoginRequest? loginRequest);
  Future<DataState<UserResponse>> loginXX(LoginRequest? loginRequest);
  Future<UserResponse> register(RegisterRequest? registerRequest);
}
