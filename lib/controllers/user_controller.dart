import 'package:flutter/cupertino.dart';
import 'package:tasks_app_provider_consumer/models/persistence/status_response.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';
import 'package:tasks_app_provider_consumer/services/interfaces/user_service.dart';
import 'package:tasks_app_provider_consumer/storage/interfaces/local_storage.dart';
import 'package:tasks_app_provider_consumer/view_models/forget_password_view_model.dart';
import 'package:tasks_app_provider_consumer/view_models/login_view_model.dart';
import 'package:tasks_app_provider_consumer/view_models/register_view_model.dart';
import 'package:tasks_app_provider_consumer/view_models/user_general_information_form_view_model.dart';

class UserController extends ChangeNotifier {
  
  final UserService _userService;
  final LocalStorage _localStorage;

  UserController({
    required UserService userService,
    required LocalStorage localStorage
  }) :
    _userService = userService,
    _localStorage = localStorage;

  User? _user;
  User? get user => _user;

  bool loading = false;

  Future<StatusResponse> register(RegisterViewModel registerViewModel) async {

    loading = true;
    notifyListeners();

    final result = await _userService.register(registerViewModel);

    if(result.isSuccess) {
      _user = result.data;

      await _localStorage.write(_user!.toJson());
    }

    loading = false;
    notifyListeners();

    return StatusResponse.fromResponseModel(responseModel: result);
  }

  Future<StatusResponse> login(LoginViewModel loginViewModel) async {

    loading = true;
    notifyListeners();

    final result = await _userService.getByEmailAndPassword(loginViewModel);

    if(result.isSuccess) {
      _user = result.data;
      await _localStorage.write(_user!.toJson());
    }

    loading = false;
    notifyListeners();

    return StatusResponse.fromResponseModel(responseModel: result);
  }

  Future<StatusResponse> redefinePassword(ForgetPasswordViewModel forgetPasswordViewModel) async {

    loading = true;
    notifyListeners();

    final result = await _userService.changePassword(forgetPasswordViewModel);

    loading = false;
    notifyListeners();

    return StatusResponse.fromResponseModel(responseModel: result);
  }

  Future<StatusResponse> changeGeneralInformation(UserGeneralInformationFormViewModel userGeneralInformationFormViewModel) async {

    loading = true;
    notifyListeners();

    final result = await _userService.changeGeneralInformation(
      userGeneralInformationFormViewModel: userGeneralInformationFormViewModel
    );

    if(result.isSuccess) {
      _user = result.data;
      await _localStorage.write(_user!.toJson());
    }

    loading = false;
    notifyListeners();

    return StatusResponse.fromResponseModel(responseModel: result);
  }

  Future<StatusResponse> logout() async {

    loading = true;
    notifyListeners();

    _user = null;
    await _localStorage.delete();

    loading = false;
    notifyListeners();

    return StatusResponse.success(message: "Saiu do aplicativo com sucesso");
  }

  Future<bool> isLogged() async {

    final result = await _localStorage.containsValue();

    if(result && _user == null) {
      final value = await _localStorage.read();
      _user = User.fromJson(value!);
      notifyListeners();
    }

    return await _localStorage.containsValue();
  }

}