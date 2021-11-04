import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/view_models/task_form_view_model.dart';

abstract class TaskService {
  
  Future<ResponseModel> getAllByUserId(dynamic userId);

  Future<ResponseModel> insert(TaskFormViewModel taskFormViewModel);

  Future<ResponseModel> update(TaskFormViewModel taskFormViewModel);

  Future<ResponseModel> delete(dynamic taskId);
}