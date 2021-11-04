import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/services/interfaces/user_service.dart';
import 'package:tasks_app_provider_consumer/view_models/register_view_model.dart';
import 'package:tasks_app_provider_consumer/view_models/login_view_model.dart';

class UserServiceImpl implements UserService {
  
  @override
  Future<ResponseModel> changePassword({required id, required String password}) async {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getByEmailAndPassword(LoginViewModel loginViewModel) async {
    // TODO: implement getByEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> register(RegisterViewModel registerViewModel) async {
    // TODO: implement insert
    throw UnimplementedError();
  }

}