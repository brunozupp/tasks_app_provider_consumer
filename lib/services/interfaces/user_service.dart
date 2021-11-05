import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';
import 'package:tasks_app_provider_consumer/view_models/login_view_model.dart';
import 'package:tasks_app_provider_consumer/view_models/register_view_model.dart';

abstract class UserService {

  Future<ResponseModel<User>> getByEmailAndPassword(LoginViewModel loginViewModel);

  Future<ResponseModel<User>> register(RegisterViewModel registerViewModel);

  Future<ResponseModel<bool>> changePassword({required dynamic id, required String password});
}