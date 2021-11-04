import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/services/interfaces/task_service.dart';
import 'package:tasks_app_provider_consumer/view_models/task_form_view_model.dart';

class TaskServiceImpl implements TaskService {
  
  @override
  Future<ResponseModel> delete(taskId) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getAllByUserId(userId) async {
    // TODO: implement getAllByUserId
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> insert(TaskFormViewModel taskFormViewModel) async {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> update(TaskFormViewModel taskFormViewModel) async {
    // TODO: implement update
    throw UnimplementedError();
  }

}