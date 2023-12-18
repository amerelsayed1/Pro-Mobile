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

  final loginState = DataState<UserResponse>.initial(
    "Initial state",
  ).obs;

  Future<void> login(LoginRequest loginRequest) async {
    try {
      loginState.value = DataState.loading("Loading news");
      final user = await authRepository.login(loginRequest);
      authRepository.saveUserToken(user.accessToken);
      loginState.value = DataState.completed(user);
    } catch (e) {
      debugPrint("${e}");
      // loginState.value = DataState.error("Error loading news: $e");
    }
  }

  String getUserToken() {
    return authRepository.getUserToken();
  }

  bool isLoggedIn() {
    return authRepository.isLoggedIn();
  }

  Future<void> loginXX(LoginRequest loginRequest) async {
    try {
      loginState.value = DataState.loading("Loading news");
      final newsData = await authRepository.login(loginRequest);
      loginState.value = DataState.completed(newsData);
    } catch (e) {
      debugPrint("${e}");
    }
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
