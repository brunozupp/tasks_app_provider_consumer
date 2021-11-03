import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/models/enums/priority.dart';
import 'package:tasks_app_provider_consumer/models/task.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_primary_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/dropdown_form_field_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/text_form_field_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/textarea_form_field_widget.dart';

class TaskFormPage extends StatelessWidget {

  final Task? task;

  const TaskFormPage({ 
    Key? key,
    this.task 
  }) : super(key: key);

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
          child: Column(
            children: [
              const TextFormFieldWidget(
                label: "Nome"
              ),
              const SizedBox(
                height: 20,
              ),
              const TextareaFormFieldWidget(
                label: "Descrição"
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownFormFieldWidget<Priority>(
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
                  debugPrint(priority.toString());
                }, 
                label: "Prioridade da tarefa",
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonPrimaryWidget(
                text: task == null ? "Registrar" : "Editar", 
                onPressed: () {
                  print("ddd");
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}