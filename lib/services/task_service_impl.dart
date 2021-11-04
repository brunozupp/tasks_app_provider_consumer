import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/models/task.dart';
import 'package:tasks_app_provider_consumer/repositories/interfaces/task_repository.dart';
import 'package:tasks_app_provider_consumer/services/interfaces/task_service.dart';
import 'package:tasks_app_provider_consumer/view_models/task_form_view_model.dart';

class TaskServiceImpl implements TaskService {

  final TaskRepository _taskRepository;

  TaskServiceImpl({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  
  @override
  Future<ResponseModel> delete(taskId) async {
    return await _taskRepository.deleteById(taskId);
  }

  @override
  Future<ResponseModel> getAllByUserId(userId) async {
    return await _taskRepository.getAllByUserId(userId);
  }

  @override
  Future<ResponseModel> insert(TaskFormViewModel taskFormViewModel) async {
    
    if(!taskFormViewModel.validate()) {
      return ResponseModel.error(
        message: "As validações não foram atendidas"
      );
    }

    Task task = Task(
      name: taskFormViewModel.nameController.text,
      description: taskFormViewModel.descriptionController.text,
      priority: taskFormViewModel.priority!,
      userId: taskFormViewModel.userId!,
    );

    return await _taskRepository.insert(task);
  }

  @override
  Future<ResponseModel> update(TaskFormViewModel taskFormViewModel) async {
    
    if(!taskFormViewModel.validate()) {
      return ResponseModel.error(
        message: "As validações não foram atendidas"
      );
    }

    Task task = Task(
      id: taskFormViewModel.id,
      name: taskFormViewModel.nameController.text,
      description: taskFormViewModel.descriptionController.text,
      priority: taskFormViewModel.priority!,
      userId: taskFormViewModel.userId!,
    );

    return await _taskRepository.update(task);
  }

}