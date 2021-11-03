import 'package:flutter/material.dart';

class TasksListPage extends StatelessWidget {
  const TasksListPage({ Key? key }) : super(key: key);

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