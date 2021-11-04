import 'package:tasks_app_provider_consumer/models/persistence/response_repository_model.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';

abstract class UserRepository {

  Future<ResponseRepositoryModel<User>> getByEmailAndPassword({required String email, required String password});

  Future<ResponseRepositoryModel<User>> register(User user);

  Future<ResponseRepositoryModel<bool>> changePassword({required dynamic id, required String password});
}