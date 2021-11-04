import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/database/client_sqlite.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';
import 'package:tasks_app_provider_consumer/models/persistence/response_repository_model.dart';
import 'package:tasks_app_provider_consumer/repositories/interfaces/user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  final ClientSqlite _clientSqlite;

  UserRepositoryImpl({required ClientSqlite clientSqlite})
    : _clientSqlite = clientSqlite;

  final String tableName = "users";

  @override
  Future<ResponseRepositoryModel<bool>> changePassword({required id, required String password}) async {
    try {

      final database = await _clientSqlite.database;

      final result = await database!.rawUpdate("UPDATE $tableName SET password = ? WHERE id = ?", [password, id]);

      if(result == 0) {
        return ResponseRepositoryModel.error(message: "Não foi alterado nenhum registro");
      } else if(result > 1) {
        return ResponseRepositoryModel.error(message: "Foi alterado mais de um registro");
      }

      return ResponseRepositoryModel.success(data: true);

    } catch (e) {
      debugPrint(e.toString());
      return ResponseRepositoryModel.error(message: "Erro ao redefinir a senha");
    }
  }

  @override
  Future<ResponseRepositoryModel<User>> getByEmailAndPassword({required String email, required String password}) async {
    try {

      final database = await _clientSqlite.database;

      final result = await database!.query(tableName, where: "email = ? AND password = ?", whereArgs: [email, password]);

      if(result.isEmpty) {
        return ResponseRepositoryModel.error(message: "Email e/ou senha incorreto(s)");
      }

      return ResponseRepositoryModel.success(data: User.fromMap(result.first));

    } catch (e) {
      debugPrint(e.toString());
      return ResponseRepositoryModel.error(message: "Erro ao redefinir a senha");
    }
  }

  @override
  Future<ResponseRepositoryModel<User>> register(User user) async {
    try {

      final database = await _clientSqlite.database;

      final result = await database!.insert(tableName, user.toMap());

      user.id = result;

      return ResponseRepositoryModel.success(data: user);

    } catch (e) {
      debugPrint(e.toString());
      return ResponseRepositoryModel.error(message: "Erro ao salvar a tarefa");
    }
  }

}