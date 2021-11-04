import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/models/task.dart';

abstract class TaskRepository {

  Future<ResponseModel<List<Task>>> getAllByUserId(dynamic userId);

  Future<ResponseModel<Task>> insert(Task task);

  Future<ResponseModel<Task>> update(Task task);

  Future<ResponseModel<bool>> deleteById(dynamic id);
}