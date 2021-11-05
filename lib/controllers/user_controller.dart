import 'package:flutter/cupertino.dart';
import 'package:tasks_app_provider_consumer/models/persistence/status_response.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';
import 'package:tasks_app_provider_consumer/services/interfaces/user_service.dart';
import 'package:tasks_app_provider_consumer/view_models/login_view_model.dart';
import 'package:tasks_app_provider_consumer/view_models/register_view_model.dart';

class UserController extends ChangeNotifier {
  
  final UserService _userService;

  UserController({required UserService userService}) :
    _userService = userService;

  User? _user;

  User? get user => _user;

  Future<StatusResponse> register(RegisterViewModel registerViewModel) async {

    final result = await _userService.register(registerViewModel);

    return StatusResponse.fromResponseModel(responseModel: result);
  }

  Future<StatusResponse> login(LoginViewModel loginViewModel) async {

    final result = await _userService.getByEmailAndPassword(loginViewModel);

    return StatusResponse.fromResponseModel(responseModel: result);
  }

  StatusResponse logout() {

    _user = null;

    return StatusResponse.success(message: "Saiu do aplicativo com sucesso");
  }

}