import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unknown/src/feature/auth/data/models/local/login_request.dart';
import 'package:unknown/src/feature/auth/data/models/local/register_request.dart';
import 'package:unknown/src/feature/auth/data/models/remote/user_response.dart';
import 'package:unknown/src/feature/auth/domain/repositories/auth_repository.dart';

import '../../../../core/state/data_state.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;

  AuthController({
    required this.authRepository,
  });

  RxBool isUser = false.obs;

  @override
  void onInit() {
    super.onInit();
    isUser.value = authRepository.isLoggedIn();
    update();
  }

  final loginState = DataState<UserResponse>.initial(
    "Initial state",
  ).obs;

  Future<DataState<UserResponse>> login(LoginRequest loginRequest) async {
    try {
      if (loginRequest.email.isEmpty) {
        loginState.value = DataState.error("Shouldn't be empty");
      } else if (loginRequest.password.isEmpty) {
        loginState.value = DataState.error("Shouldn't be empty");
      } else {
        loginState.value = DataState.loading("Loading news");
        final user = await authRepository.login(loginRequest);
        authRepository.saveUserToken(user.accessToken);
        authRepository.saveUser(user);
        loginState.value = DataState.completed(user);
      }
    } on DioException catch (e) {
      List<String> messages = List<String>.from(e.response?.data['messages']);
      loginState.value = DataState.error(messages.first);
    }
    return loginState.value;
  }

  String getUserToken() {
    return authRepository.getUserToken();
  }

  UserResponse getUser() {
    return authRepository.getUser();
  }

  bool isLoggedIn() {
    isUser.value = authRepository.isLoggedIn();
    update();
    return authRepository.isLoggedIn();
  }

  logout() {
    authRepository.logout();
  }

  Future<void> register(RegisterRequest registerRequest) async {
    try {
      loginState.value = DataState.loading("Loading news");
      final newsData = await authRepository.register(registerRequest);
      loginState.value = DataState.completed(newsData);
    } catch (e) {
      debugPrint("${e}");
    }
  }
}
