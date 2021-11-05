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
  List<Task> get tasks => _tasks;

  /* Contexto de uso dessa variável
   * A fim de evitar o desgaste do meu 'backend' de ficar batendo nele a cada vez que eu entro na tela de
   * listagem das Tasks, essa variável vai controlar quando vou pedir para o meu banco as Tasks. Depois que
   * for executado pela primeira vez, vai setar para True para indicar que a partir de agora o meu ponto
   * de datasource vai ser a minha variável '_tasks'
   */
  bool _hasAlreadyGetTasks = false;

  Future<StatusResponse> getAllByUserId(dynamic userId) async {

    if(_hasAlreadyGetTasks) return StatusResponse.success();
    
    final result = await _taskService.getAllByUserId(userId);

    if(result.data != null) {
      _tasks.addAll(result.data!);
      
      _hasAlreadyGetTasks = true;

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