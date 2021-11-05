import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app_provider_consumer/controllers/task_controller.dart';
import 'package:tasks_app_provider_consumer/models/enums/priority.dart';
import 'package:tasks_app_provider_consumer/models/task.dart';
import 'package:tasks_app_provider_consumer/styles/colors_app.dart';
import 'package:tasks_app_provider_consumer/utils/modal_utils.dart';
import 'package:tasks_app_provider_consumer/utils/snackbar_utils.dart';

enum _Actions { delete, edit, cancel }

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
        trailing: PopupMenuButton<_Actions>(
          onSelected: (_Actions action) async {
            switch(action) {
              case _Actions.delete:
                final confirmation = await ModalUtils.showModalConfirmation(context);

                if(confirmation != true) return;

                final result = await Provider.of<TaskController>(context, listen: false).delete(task.id);

                SnackbarUtils.showSnackbarStatusResponse(context: context, statusResponse: result);

                break;
              case _Actions.edit:
                Navigator.of(context).pushNamed("/tasks/form", arguments: task);
                break;
              case _Actions.cancel:
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<_Actions>>[
            PopupMenuItem<_Actions>(
              value: _Actions.edit,
              child: Row(
                children: const [
                  Icon(
                    Icons.edit,
                    color: ColorsApp.primaryColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Editar")
                ],
              ),
            ),
            PopupMenuItem<_Actions>(
              value: _Actions.delete,
              child: Row(
                children: const [
                  Icon(
                    Icons.delete,
                    color: ColorsApp.errorColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Deletar")
                ],
              ),
            ),
            PopupMenuItem<_Actions>(
              value: _Actions.cancel,
              child: Row(
                children: const [
                  Icon(
                    Icons.cancel,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Cancelar")
                ],
              ),
            ),
          ],
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