import 'package:unknown/src/feature/auth/data/models/local/login_request.dart';
import 'package:unknown/src/feature/auth/data/models/local/register_request.dart';
import 'package:unknown/src/feature/auth/data/models/remote/user_response.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';

import '../../../../core/state/data_state.dart';
import '../../../experts/data/models/expert_response.dart';

abstract class AuthRepository {
  Future<DataState<UserResponse>> login(LoginRequest? loginRequest);
  Future<DataState> register(RegisterRequest? registerRequest);
}
