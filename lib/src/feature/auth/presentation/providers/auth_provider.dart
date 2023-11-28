import 'package:flutter/material.dart';
import 'package:unknown/src/feature/auth/data/models/local/login_request.dart';
import 'package:unknown/src/feature/auth/data/models/remote/user_response.dart';

import '../../../../core/state/data_state.dart';
import '../../domain/use_case/login_use_case.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  AuthProvider({
    required this.loginUseCase,
  });

  DataState<UserResponse> _apiLoginResponse = DataState.loading(
    'loading',
  );

  DataState<UserResponse> get apiLoginResponse {
    return _apiLoginResponse;
  }

  Future<void> login(LoginRequest loginRequest) async {
    _apiLoginResponse = await loginUseCase.login(loginRequest);
    notifyListeners();
  }

}
