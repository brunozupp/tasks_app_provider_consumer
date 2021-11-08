import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app_provider_consumer/controllers/task_controller.dart';
import 'package:tasks_app_provider_consumer/controllers/user_controller.dart';
import 'package:tasks_app_provider_consumer/models/persistence/status_response.dart';
import 'package:tasks_app_provider_consumer/pages/default/error_page.dart';
import 'package:tasks_app_provider_consumer/pages/default/loading_page.dart';
import 'package:tasks_app_provider_consumer/pages/tasks/components/task_item_component.dart';

// final _tasks = <Task>[
//   Task(userId: 1, name: "Tarefa 1", description: "Uma descrição um pouco divertida sobre o assunto em questão para ser levado em conta para a banca eleitoral levado em conta para a banca eleitoral levado em conta para a banca eleitoral", priority: Priority.normal),
//   Task(userId: 1, name: "Tarefa 2", description: "Uma descrição um pouco divertida sobre o assunto em questão", priority: Priority.medium),
//   Task(userId: 1, name: "Tarefa 3", description: "Uma descrição um pouco divertida sobre o assunto em questão para ser levado em conta para a banca eleitoral", priority: Priority.high),
//   Task(userId: 1, name: "Tarefa 4", description: "Uma descrição um pouco divertida sobre o assunto em questão", priority: Priority.high),
//   Task(userId: 1, name: "Tarefa 1", description: "Uma descrição um pouco divertida sobre o assunto em questão para ser levado em conta para a banca eleitoral levado em conta para a banca eleitoral levado em conta para a banca eleitoral", priority: Priority.normal),
//   Task(userId: 1, name: "Tarefa 2", description: "Uma descrição um pouco divertida sobre o assunto em questão", priority: Priority.medium),
//   Task(userId: 1, name: "Tarefa 3", description: "Uma descrição um pouco divertida sobre o assunto em questão para ser levado em conta para a banca eleitoral", priority: Priority.high),
//   Task(userId: 1, name: "Tarefa 4", description: "Uma descrição um pouco divertida sobre o assunto em questão", priority: Priority.high),
//   Task(userId: 1, name: "Tarefa 1", description: "Uma descrição um pouco divertida sobre o assunto em questão para ser levado em conta para a banca eleitoral levado em conta para a banca eleitoral levado em conta para a banca eleitoral", priority: Priority.normal),
//   Task(userId: 1, name: "Tarefa 2", description: "Uma descrição um pouco divertida sobre o assunto em questão", priority: Priority.medium),
//   Task(userId: 1, name: "Tarefa 3", description: "Uma descrição um pouco divertida sobre o assunto em questão para ser levado em conta para a banca eleitoral", priority: Priority.high),
//   Task(userId: 1, name: "Tarefa 4", description: "Uma descrição um pouco divertida sobre o assunto em questão", priority: Priority.high),
// ];

class TasksListPage extends StatelessWidget {
  const TasksListPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.note_add_rounded,
        ),
        onPressed: () => Navigator.of(context).pushNamed("/tasks/form")
      ),
      body: FutureBuilder<StatusResponse>(
        future: Provider.of<TaskController>(context, listen: false).getAllByUserId(
          Provider.of<UserController>(context, listen: false).user!.id
        ),
        builder: (context, snapshot) {

          if(snapshot.hasError) {
            return const ErrorPage(text: "Algo inesperado ocorreu!!!");
          }

          if(snapshot.connectionState == ConnectionState.none || snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          }

          if(snapshot.hasData && snapshot.data!.isError) {
            return ErrorPage(text: snapshot.data!.message!);
          }

          return Consumer<TaskController>(
            builder: (_,controller,child) {
      
              if(controller.tasks.isEmpty) {
                return const Center(
                  child: Text(
                    "Nenhuma tarefa foi registrada",
                  ),
                );
              }
      
              final tasks = controller.tasks;
      
              return ListView.separated(
                padding: const EdgeInsets.only(bottom: 100),
                itemCount: tasks.length,
                separatorBuilder: (_,index) => const SizedBox(height: 10),
                itemBuilder: (_,index) {
                  
                  final task = tasks[index];
                  
                  return TaskItemComponent(task: task);
                }
              );
            },
          );
        }
      ),
    );
  }
}