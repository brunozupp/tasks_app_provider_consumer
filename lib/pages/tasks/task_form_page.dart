import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app_provider_consumer/controllers/task_controller.dart';
import 'package:tasks_app_provider_consumer/controllers/user_controller.dart';
import 'package:tasks_app_provider_consumer/models/enums/priority.dart';
import 'package:tasks_app_provider_consumer/models/persistence/status_response.dart';
import 'package:tasks_app_provider_consumer/models/task.dart';
import 'package:tasks_app_provider_consumer/utils/snackbar_utils.dart';
import 'package:tasks_app_provider_consumer/view_models/task_form_view_model.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_primary_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/dropdown_form_field_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/text_form_field_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/textarea_form_field_widget.dart';

class TaskFormPage extends StatelessWidget {

  final Task? task;

  TaskFormPage({ 
    Key? key,
    this.task 
  }) : super(key: key) {
    taskFormVM = TaskFormViewModel(
      task: task
    );
  }

  late final TaskFormViewModel taskFormVM;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          task == null ? "Registrar tarefa" : "Editar tarefa"
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: taskFormVM.formKey,
          child: Column(
            children: [
              TextFormFieldWidget(
                label: "Nome",
                controller: taskFormVM.nameController,
                keyboardType: TextInputType.name,
                validator: taskFormVM.validateName,
              ),
              const SizedBox(
                height: 20,
              ),
              TextareaFormFieldWidget(
                label: "Descrição",
                controller: taskFormVM.descriptionController,
                validator: taskFormVM.validateDescription,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownFormFieldWidget<Priority>(
                value: taskFormVM.priority,
                validator: taskFormVM.validatePriority,
                onGenerateDescription: (priority) {
                  switch(priority) {
                    case Priority.normal:
                      return "Normal";
                    case Priority.medium:
                      return "Média";
                    case Priority.high:
                      return "Alta";
                    default:
                      return "Selecione";
                  }
                },
                items: Priority.values, 
                onChanged: (priority) {
                  taskFormVM.priority = priority;
                }, 
                label: "Prioridade da tarefa",
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonPrimaryWidget(
                text: task == null ? "Registrar" : "Editar", 
                onPressed: () async {

                  taskFormVM.userId ??= Provider.of<UserController>(context, listen: false).user!.id;

                  late final StatusResponse result;

                  if(taskFormVM.id == null) {
                    result = await Provider.of<TaskController>(context, listen: false).add(taskFormVM);
                  } else {
                    result = await Provider.of<TaskController>(context, listen: false).update(taskFormVM);
                  }

                  if(result.isError) {
                    SnackbarUtils.showSnackbarStatusResponse(context: context, statusResponse: result);
                    return;
                  }

                  SnackbarUtils.showSnackbarStatusResponse(context: context, statusResponse: result);

                  Navigator.of(context).pop();
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}