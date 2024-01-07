import 'package:unknown/src/feature/auth/data/models/local/login_request.dart';
import 'package:unknown/src/feature/auth/data/models/local/register_request.dart';
import 'package:unknown/src/feature/auth/data/models/remote/user_response.dart';

import '../../../../core/state/data_state.dart';

abstract class AuthRepository {
  Future<UserResponse> login(LoginRequest? loginRequest);
  Future<UserResponse> register(RegisterRequest? registerRequest);

  // for user
  Future<bool> saveUser(UserResponse user);
  UserResponse getUser() ;
  void logout();

  Future<bool> saveUserToken(String token);
  String getUserToken() ;
  bool isLoggedIn();

}
