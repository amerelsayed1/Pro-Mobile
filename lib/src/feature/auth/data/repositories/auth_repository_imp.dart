
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unknown/common/util/constants.dart';
import 'package:unknown/src/core/state/data_state.dart';

import 'package:unknown/src/feature/auth/data/data_sources/auth_data_source.dart';
import 'package:unknown/src/feature/auth/data/models/local/login_request.dart';
import 'package:unknown/src/feature/auth/data/models/local/register_request.dart';
import 'package:unknown/src/feature/auth/data/models/remote/user_response.dart';
import 'package:unknown/src/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.dataSource,
    required this.sharedPreferences,
  });

  final AuthDataSource dataSource;
  final SharedPreferences sharedPreferences;

  @override
  Future<UserResponse> login(LoginRequest? loginRequest) async {
    return dataSource.login(loginRequest);
  }

  @override
  Future<UserResponse> register(RegisterRequest? registerRequest) async {
    return dataSource.register(registerRequest);
  }

  @override
  Future<DataState<UserResponse>> loginX(LoginRequest? loginRequest) {
    return dataSource.loginXX(loginRequest);
  }

  @override
  Future<bool> saveUserToken(String token) async {
    return await sharedPreferences.setString(Constants.token, token);
  }

  @override
  String getUserToken() {
    return sharedPreferences.getString(Constants.token) ?? "";
  }

  @override
  bool isLoggedIn() {
    return sharedPreferences.containsKey(Constants.token);
  }


}
