import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/models/task.dart';

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
        title: const Text(""),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(),
      ),
    );
  }
}