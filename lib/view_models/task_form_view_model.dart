import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/models/enums/priority.dart';
import 'package:tasks_app_provider_consumer/models/task.dart';

import 'base_view_model.dart';

class TaskFormViewModel extends BaseViewModel {
  
  late final int? userId; 
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  late Priority? priority;

  TaskFormViewModel(Task? task) {
    userId = task?.userId;
    nameController.text = task?.name ?? "";
    descriptionController.text = task?.description ?? "";
    priority = task?.priority;
  }

  String? validateName(String? value) {
    if(value == null || value.isEmpty) {
      return "Campo obrigatório";
    }

    return null;
  }

  String? validateDescription(String? value) {
    if(value == null || value.isEmpty) {
      return "Campo obrigatório";
    }

    if(value.length != 150) {
      return "Descrição deve possuir até 150 caracteres";
    }

    return null;
  }

  String? validatePriority(Priority? value) {
    if(value == null) {
      return "Campo obrigatório";
    }

    return null;
  }

}