import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/models/enums/priority.dart';
import 'package:tasks_app_provider_consumer/models/task.dart';

class TaskItemComponent extends StatelessWidget {

  final Task task;

  const TaskItemComponent({ 
    Key? key, 
    required this.task 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(
            color: _getBorderColor(task.priority),
            width: 10,
          )
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
          ),
          BoxShadow(
            color: Colors.black,
            offset: Offset(0,-0.1)
          ),
        ]
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(task.name),
        subtitle: Text(
          task.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Color _getBorderColor(Priority priority) {
    switch(priority) {

      case Priority.normal:
        return Colors.green;
      case Priority.medium:
        return Colors.yellow.shade700;
      case Priority.high:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}