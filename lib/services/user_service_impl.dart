import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';
import 'package:tasks_app_provider_consumer/repositories/interfaces/user_repository.dart';
import 'package:tasks_app_provider_consumer/services/interfaces/user_service.dart';
import 'package:tasks_app_provider_consumer/view_models/register_view_model.dart';
import 'package:tasks_app_provider_consumer/view_models/login_view_model.dart';

class UserServiceImpl implements UserService {

  final UserRepository _userRepository;

  UserServiceImpl({required UserRepository userRepository})
    : _userRepository = userRepository;
  
  @override
  Future<ResponseModel<bool>> changePassword({required id, required String password}) async {
    return await _userRepository.changePassword(id: id, password: password);
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

    User user = User(
      email: registerViewModel.emailController.text,
      name: registerViewModel.nameController.text,
      password: registerViewModel.passwordController.text
    );

    return await _userRepository.register(user);
  }
}