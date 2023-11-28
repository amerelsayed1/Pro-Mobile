import 'package:dio/dio.dart';
import 'package:unknown/src/feature/auth/data/models/local/register_request.dart';

import '../models/local/login_request.dart';

abstract class AuthDataSource {
  Future<Response> login(LoginRequest? loginRequest);
  Future<Response> register(RegisterRequest? registerRequest);
}
