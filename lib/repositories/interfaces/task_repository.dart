import 'package:tasks_app_provider_consumer/models/persistence/response_repository_model.dart';
import 'package:tasks_app_provider_consumer/models/task.dart';

abstract class TaskRepository {

  Future<ResponseRepositoryModel<List<Task>>> getAllByUserId(dynamic userId);

  Future<ResponseRepositoryModel<Task>> insert(Task task);

  Future<ResponseRepositoryModel<Task>> update(Task task);

  Future<ResponseRepositoryModel<bool>> deleteById(dynamic id);
}