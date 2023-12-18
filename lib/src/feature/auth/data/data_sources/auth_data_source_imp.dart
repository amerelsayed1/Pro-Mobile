import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unknown/common/util/constants.dart';
import 'package:unknown/src/core/state/data_state.dart';
import 'package:unknown/src/feature/auth/data/models/local/register_request.dart';
import 'package:unknown/src/feature/auth/data/models/remote/user_response.dart';

import '../models/local/login_request.dart';
import 'auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {
  AuthDataSourceImpl({
    required this.client,
  });

  final Dio client;

  @override
  Future<UserResponse> login(LoginRequest? loginRequest) async {
    final response = await client.post(
      Constants.login,
      data: loginRequest?.toMap(),
    );

    if (response.statusCode == 200) {
      return UserResponse.fromJson(response.data);
    } else {
      handleErrorResponse(response);
      throw Exception('Failed to load login response');
    }
  }

  void handleErrorResponse(Response response) {
    try {
      // Parse the error details from the response data
      Map<String, dynamic> errorDetails = json.decode(response.toString());

      // Extract and print the error messages
      List<String> errorMessages = List<String>.from(errorDetails['messages']);
      errorMessages.forEach((message) {
        print('Error: $message');
      });
    } catch (e) {
      // Handle parsing error
      print('Error parsing error response: $e');
    }
  }

  @override
  Future<UserResponse> register(RegisterRequest? registerRequest) async {
    final response = await client.post(
      Constants.register,
      data: registerRequest?.toMap(),
    );

    if (response.statusCode == 200) {
      return UserResponse.fromJson(response.data);
    } else {
      handleErrorResponse(response);
      throw Exception('Failed to load login response');
    }
  }

  @override
  Future<DataState<UserResponse>> loginXX(LoginRequest? loginRequest) {
    // TODO: implement loginXX
    throw UnimplementedError();
  }
}
