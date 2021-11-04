import 'package:tasks_app_provider_consumer/models/task.dart';
import 'package:tasks_app_provider_consumer/models/persistence/response_repository_model.dart';
import 'package:tasks_app_provider_consumer/repositories/interfaces/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  
  @override
  Future<ResponseRepositoryModel<bool>> deleteById(id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<ResponseRepositoryModel<List<Task>>> getAllByUserId(userId) {
    // TODO: implement getAllByUserId
    throw UnimplementedError();
  }

  @override
  Future<ResponseRepositoryModel<Task>> insert(Task task) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<ResponseRepositoryModel<Task>> update(Task task) {
    // TODO: implement update
    throw UnimplementedError();
  }

}