import 'package:flutter/cupertino.dart';
import 'package:tasks_app_provider_consumer/database/client_sqlite.dart';
import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/models/task.dart';
import 'package:tasks_app_provider_consumer/repositories/interfaces/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {

  final ClientSqlite _clientSqlite;

  TaskRepositoryImpl({required ClientSqlite clientSqlite})
    : _clientSqlite = clientSqlite;

  final String tableName = "tasks";
  
  @override
  Future<ResponseModel<bool>> deleteById(id) async {
      
    try {
      final database = await _clientSqlite.database;

      final result = await database!.delete(tableName, where: "id = ?", whereArgs: [id]);

      if(result == 0) {
        return ResponseModel.error(message: "Não foi deletada nenhuma tarefa");
      } else if(result > 1) {
        return ResponseModel.error(message: "Foi deletada mais de uma tarefa");
      }

      return ResponseModel.success(data: true);

    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel.error(message: "Erro ao deletar a tarefa");
    }
  }

  @override
  Future<ResponseModel<List<Task>>> getAllByUserId(userId) async {
    try {
      final database = await _clientSqlite.database;

      final result = await database!.query(tableName, where: "id = ?", whereArgs: [userId]);

      final tasks = result.map((e) => Task.fromMap(e)).toList();

      return ResponseModel.success(data: tasks);

    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel.error(message: "Erro ao pegar as tarefa");
    }
  }

  @override
  Future<ResponseModel<Task>> insert(Task task) async {
    
    try {

      final database = await _clientSqlite.database;

      final result = await database!.insert(tableName, task.toMap());

      task.id = result;

      return ResponseModel.success(data: task);

    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel.error(message: "Erro ao salvar a tarefa");
    }
  }

  @override
  Future<ResponseModel<Task>> update(Task task) async {
    try {

      final database = await _clientSqlite.database;

      final result = await database!.update(tableName, task.toMap(), where: "id = ?", whereArgs: [task.id]);

      if(result == 0) {
        return ResponseModel.error(message: "Não foi alterado nenhuma tarefa");
      } else if(result > 1) {
        return ResponseModel.error(message: "Foi alterado mais de uma tarefa");
      }

      return ResponseModel.success(data: task);

    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel.error(message: "Erro ao editar a tarefa");
    }
  }

}