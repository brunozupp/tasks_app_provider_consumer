import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/models/persistence/status_response.dart';
import 'package:tasks_app_provider_consumer/models/task.dart';
import 'package:tasks_app_provider_consumer/services/interfaces/task_service.dart';
import 'package:tasks_app_provider_consumer/view_models/task_form_view_model.dart';

class TaskController extends ChangeNotifier {

  final TaskService _taskService;

  TaskController({required TaskService taskService}) :
    _taskService = taskService;

  final List<Task> _tasks = List<Task>.empty(growable: true);

  Future<StatusResponse> getAllByUserId(dynamic userId) async {
    
    final result = await _taskService.getAllByUserId(userId);

    if(result.data != null) {
      _tasks.addAll(result.data!);
      notifyListeners();
    }

    return StatusResponse.fromResponseModel(responseModel: result);
  }

  Future<StatusResponse> add(TaskFormViewModel taskFormViewModel) async {
    
    final result = await _taskService.insert(taskFormViewModel);

    if(result.data != null) {
      _tasks.add(result.data!);
      notifyListeners();
    }

    return StatusResponse.fromResponseModel(responseModel: result);
  }

  Future<StatusResponse> update(TaskFormViewModel taskFormViewModel) async {
    
    final result = await _taskService.update(taskFormViewModel);

    if(result.data != null) {

      _tasks.removeWhere((task) => task.id == taskFormViewModel.id);
      _tasks.add(result.data!);

      notifyListeners();
    }

    return StatusResponse.fromResponseModel(responseModel: result);
  }

  Future<StatusResponse> delete(dynamic id) async {
    
    final result = await _taskService.delete(id);

    if(result.data != null) {
      _tasks.removeWhere((task) => task.id == id);
      notifyListeners();
    }

    return StatusResponse.fromResponseModel(responseModel: result);
  }
}