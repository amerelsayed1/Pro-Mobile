import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unknown/src/feature/auth/data/models/local/login_request.dart';
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
      final newsData = await authRepository.login(loginRequest);
      loginState.value = DataState.completed(newsData);
    } catch (e) {
      debugPrint("${e}");
     // loginState.value = DataState.error("Error loading news: $e");
    }
  }

  Future<void> loginXX(LoginRequest loginRequest) async {
    try {
      loginState.value = DataState.loading("Loading news");
      final newsData = await authRepository.login(loginRequest);
      loginState.value = DataState.completed(newsData);
    } catch (e) {
      debugPrint("${e}");
     // loginState.value = DataState.error("Error loading news: $e");
    }
  }


}
