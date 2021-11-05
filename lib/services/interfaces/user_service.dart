import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';
import 'package:tasks_app_provider_consumer/view_models/forget_password_view_model.dart';
import 'package:tasks_app_provider_consumer/view_models/login_view_model.dart';
import 'package:tasks_app_provider_consumer/view_models/register_view_model.dart';
import 'package:tasks_app_provider_consumer/view_models/user_general_information_form_view_model.dart';

abstract class UserService {

  Future<ResponseModel<User>> getByEmailAndPassword(LoginViewModel loginViewModel);

  Future<ResponseModel<User>> register(RegisterViewModel registerViewModel);

  Future<ResponseModel<bool>> changePassword(ForgetPasswordViewModel forgetPasswordViewModel);

  Future<ResponseModel<User>> changeGeneralInformation({
    required UserGeneralInformationFormViewModel userGeneralInformationFormViewModel
  });
}