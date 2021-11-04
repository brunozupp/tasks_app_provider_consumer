import 'package:tasks_app_provider_consumer/models/user.dart';
import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/repositories/interfaces/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  
  @override
  Future<ResponseModel<bool>> changePassword({required id, required String password}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel<User>> getByEmailAndPassword(User user) {
    // TODO: implement getByEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel<User>> insert(User user) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel<User>> update(User user) {
    // TODO: implement update
    throw UnimplementedError();
  }

}