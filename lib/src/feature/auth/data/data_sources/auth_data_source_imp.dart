import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:unknown/common/util/constants.dart';
import 'package:unknown/src/feature/auth/data/models/local/register_request.dart';

import '../models/local/login_request.dart';
import 'auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {
  AuthDataSourceImpl({
    required this.client,
  });

  final Dio client;

  @override
  Future<Response> login(LoginRequest? loginRequest) async {
    final response = await client.post(
      Constants.login,
      data: loginRequest?.toMap(),
    );
    return response;
  }

  @override
  Future<Response> register(RegisterRequest? registerRequest) async {
    final response = await client.post(
      Constants.register,
      data: registerRequest?.toMap(),
    );
    return response;
  }
}
