import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/services/interfaces/task_service.dart';
import 'package:tasks_app_provider_consumer/view_models/task_form_view_model.dart';

class TaskServiceImpl implements TaskService {
  
  @override
  Future<ResponseModel> delete(taskId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getAllByUserId(userId) {
    // TODO: implement getAllByUserId
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> insert(TaskFormViewModel taskFormViewModel) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> update(TaskFormViewModel taskFormViewModel) {
    // TODO: implement update
    throw UnimplementedError();
  }

}