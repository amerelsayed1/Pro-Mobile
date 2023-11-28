import 'package:get/get.dart';
import 'package:unknown/src/feature/auth/data/models/local/register_request.dart';

import '../../../../core/state/data_state.dart';
import '../../data/models/local/login_request.dart';
import '../../data/models/remote/user_response.dart';
import '../../domain/use_case/login_use_case.dart';
import '../../domain/use_case/register_use_case.dart';

class AuthController extends GetxController implements GetxService {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthController({
    required this.loginUseCase,
    required this.registerUseCase,
  });

  DataState<UserResponse> _apiLoginResponse = DataState.loading(
    'loading',
  );

  DataState<UserResponse> get apiLoginResponse {
    return _apiLoginResponse;
  }

  Future<DataState<UserResponse>> login(LoginRequest loginRequest) async {
    _isLoading = true;
    update();
    _apiLoginResponse = await loginUseCase.login(loginRequest);
    _isLoading = false;
    update();
    return _apiLoginResponse;
  }

  DataState _apiRegisterResponse = DataState.loading(
    'loading',
  );

  DataState get apiRegisterResponse {
    return _apiRegisterResponse;
  }

  Future<DataState> register(RegisterRequest registerRequest) async {
    _isLoading = true;
    update();
    _apiRegisterResponse = await registerUseCase.register(registerRequest);
    _isLoading = false;
    update();
    return _apiRegisterResponse;
  }
}
