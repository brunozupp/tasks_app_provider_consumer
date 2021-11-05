import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/database/client_sqlite.dart';
import 'package:tasks_app_provider_consumer/models/persistence/response_model.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';
import 'package:tasks_app_provider_consumer/repositories/interfaces/user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  final ClientSqlite _clientSqlite;

  UserRepositoryImpl({required ClientSqlite clientSqlite})
    : _clientSqlite = clientSqlite;

  final String tableName = "users";

  @override
  Future<ResponseModel<bool>> changePassword({required String email, required String password}) async {
    try {

      final database = await _clientSqlite.database;

      final existEmail = (await database!.query(tableName, where: "email = ?", whereArgs: [email])).isNotEmpty;

      if(!existEmail) {
        return ResponseModel.error(message: "Email informado não existe");
      }

      final result = await database.rawUpdate("UPDATE $tableName SET password = ? WHERE email = ?", [password, email]);

      if(result == 0) {
        return ResponseModel.error(message: "Não foi alterado nenhum registro");
      } else if(result > 1) {
        return ResponseModel.error(message: "Foi alterado mais de um registro");
      }

      return ResponseModel.success(data: true, message: "Senha redefinida com sucesso");

    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel.error(message: "Erro ao redefinir a senha");
    }
  }

  @override
  Future<ResponseModel<User>> getByEmailAndPassword({required String email, required String password}) async {
    try {

      final database = await _clientSqlite.database;

      final result = await database!.query(tableName, where: "email = ? AND password = ?", whereArgs: [email, password]);

      if(result.isEmpty) {
        return ResponseModel.error(message: "Email e/ou senha incorreto(s)");
      }

      User user = User.fromMap(result.first)
        ..password = "";

      return ResponseModel.success(data: user);

    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel.error(message: "Erro ao redefinir a senha");
    }
  }

  @override
  Future<ResponseModel<User>> register(User user) async {
    try {

      final database = await _clientSqlite.database;

      final result = await database!.insert(tableName, user.toMap());

      user.id = result;
      user.password = "";

      return ResponseModel.success(data: user);

    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel.error(message: "Erro ao salvar a tarefa");
    }
  }

  @override
  Future<ResponseModel<User>> changeGeneralInformation({required User user}) async {
    try {

      final database = await _clientSqlite.database;

      final result = await database!.rawUpdate("UPDATE $tableName SET name = ?, email = ? WHERE id = ?", [user.name, user.email, user.id]);

      if(result == 0) {
        return ResponseModel.error(message: "Não foi alterado nenhum registro");
      } else if(result > 1) {
        return ResponseModel.error(message: "Foi alterado mais de um registro");
      }

      return ResponseModel.success(data: user);

    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel.error(message: "Erro ao redefinir a senha");
    }
  }

}