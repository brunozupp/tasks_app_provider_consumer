import 'package:tasks_app_provider_consumer/models/user.dart';
import 'package:tasks_app_provider_consumer/models/persistence/response_repository_model.dart';
import 'package:tasks_app_provider_consumer/repositories/interfaces/user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  @override
  Future<ResponseRepositoryModel<bool>> changePassword({required id, required String password}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<ResponseRepositoryModel<User>> getByEmailAndPassword({required String email, required String password}) {
    // TODO: implement getByEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<ResponseRepositoryModel<User>> register(User user) {
    // TODO: implement insert
    throw UnimplementedError();
  }

}