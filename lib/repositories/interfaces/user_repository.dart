import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';

abstract class UserRepository {

  Future<ResponseModel<User>> getByEmailAndPassword(User user);

  Future<ResponseModel<User>> insert(User user);

  Future<ResponseModel<User>> update(User user);

  Future<ResponseModel<bool>> changePassword({required dynamic id, required String password});
}