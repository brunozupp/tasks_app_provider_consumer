import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';

abstract class UserRepository {

  Future<ResponseModel<User>> getByEmailAndPassword({required String email, required String password});

  Future<ResponseModel<User>> register(User user);

  Future<ResponseModel<bool>> changePassword({required dynamic id, required String password});

  Future<ResponseModel<User>> changeGeneralInformation({required User user});
}