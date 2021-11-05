import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/models/task.dart';
import 'package:tasks_app_provider_consumer/view_models/task_form_view_model.dart';

abstract class TaskService {
  
  Future<ResponseModel<List<Task>>> getAllByUserId(dynamic userId);

  Future<ResponseModel<Task>> insert(TaskFormViewModel taskFormViewModel);

  Future<ResponseModel<Task>> update(TaskFormViewModel taskFormViewModel);

  Future<ResponseModel<bool>> delete(dynamic taskId);
}