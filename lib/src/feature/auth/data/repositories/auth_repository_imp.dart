import 'package:dio/dio.dart';
import 'package:unknown/src/core/state/data_state.dart';
import 'package:unknown/src/core/state/error_response.dart';
import 'package:unknown/src/feature/auth/data/data_sources/auth_data_source.dart';
import 'package:unknown/src/feature/auth/data/models/local/login_request.dart';
import 'package:unknown/src/feature/auth/data/models/local/register_request.dart';
import 'package:unknown/src/feature/auth/data/models/remote/user_response.dart';
import 'package:unknown/src/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.dataSource,
  });

  final AuthDataSource dataSource;

  @override
  Future<DataState<UserResponse>> login(LoginRequest? loginRequest) async {
    DataState<UserResponse> apiResponse = DataState.loading(
      'loading',
    );
    try {
      final response = await dataSource.login(loginRequest);
      apiResponse = DataState.completed(UserResponse.fromJson(response.data));
      return apiResponse;
    } catch (e) {
      apiResponse = DataState.error(e.toString());
      return apiResponse;
    }
  }

  @override
  Future<DataState> register(RegisterRequest? registerRequest) async {
    DataState apiResponse = DataState.loading(
      'loading',
    );
    try {
      final response = await dataSource.register(registerRequest);
      apiResponse = DataState.completed(null);
      return apiResponse;
    } on DioException catch (e) {
      ErrorResponse error = ErrorResponse.fromJson(e.response?.data);
      apiResponse = DataState.error(error.messages?.join("") ?? "");
      return apiResponse;
    }
  }
}
