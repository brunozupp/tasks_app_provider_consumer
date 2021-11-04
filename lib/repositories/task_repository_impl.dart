import 'package:tasks_app_provider_consumer/models/task.dart';
import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/repositories/interfaces/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  
  @override
  Future<ResponseModel<bool>> deleteById(id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel<List<Task>>> getAllByUserId(userId) {
    // TODO: implement getAllByUserId
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel<Task>> insert(Task task) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel<Task>> update(Task task) {
    // TODO: implement update
    throw UnimplementedError();
  }

}