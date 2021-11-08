import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';
import 'package:tasks_app_provider_consumer/repositories/interfaces/user_repository.dart';
import 'package:tasks_app_provider_consumer/services/interfaces/user_service.dart';
import 'package:tasks_app_provider_consumer/view_models/forget_password_view_model.dart';
import 'package:tasks_app_provider_consumer/view_models/register_view_model.dart';
import 'package:tasks_app_provider_consumer/view_models/login_view_model.dart';
import 'package:tasks_app_provider_consumer/view_models/user_general_information_form_view_model.dart';

class UserServiceImpl implements UserService {

  final UserRepository _userRepository;

  UserServiceImpl({required UserRepository userRepository})
    : _userRepository = userRepository;
  
  @override
  Future<ResponseModel<bool>> changePassword(ForgetPasswordViewModel forgetPasswordViewModel) async {

    if(!forgetPasswordViewModel.validate()) {
      return ResponseModel.error(
        message: "As validações não foram atendidas"
      );
    }

    return await _userRepository.changePassword(
      email: forgetPasswordViewModel.emailController.text,
      password: forgetPasswordViewModel.passwordController.text
    );
  }

  @override
  Future<ResponseModel<User>> getByEmailAndPassword(LoginViewModel loginViewModel) async {

    if(!loginViewModel.validate()) {
      return ResponseModel.error(
        message: "As validações não foram atendidas"
      );
    }

    return await _userRepository.getByEmailAndPassword(
      email: loginViewModel.emailController.text,
      password: loginViewModel.passwordController.text
    );
  }

  @override
  Future<ResponseModel<User>> register(RegisterViewModel registerViewModel) async {

    if(!registerViewModel.validate()) {
      return ResponseModel.error(
        message: "As validações não foram atendidas"
      );
    }

    final hasEmailRegistered = await hasEmail(registerViewModel.emailController.text);

    if(hasEmailRegistered.data!) {
      return ResponseModel.error(
        message: "Esse email já foi cadastrado"
      );
    }

    User user = User(
      email: registerViewModel.emailController.text,
      name: registerViewModel.nameController.text,
      password: registerViewModel.passwordController.text
    );

    return await _userRepository.register(user);
  }

  @override
  Future<ResponseModel<User>> changeGeneralInformation({
    required UserGeneralInformationFormViewModel userGeneralInformationFormViewModel
  }) async {

    if(!userGeneralInformationFormViewModel.validate()) {
      return ResponseModel.error(
        message: "As validações não foram atendidas"
      );
    }

    User user = User(
      id: userGeneralInformationFormViewModel.id,
      email: userGeneralInformationFormViewModel.emailController.text,
      name: userGeneralInformationFormViewModel.nameController.text,
    );

    return await _userRepository.changeGeneralInformation(
      user: user
    );
  }

  @override
  Future<ResponseModel<bool>> hasEmail(String email) async {
    return await _userRepository.hasEmail(email);
  }
}