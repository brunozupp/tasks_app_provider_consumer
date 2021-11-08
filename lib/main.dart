import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app_provider_consumer/app_widget.dart';
import 'package:tasks_app_provider_consumer/controllers/task_controller.dart';
import 'package:tasks_app_provider_consumer/controllers/user_controller.dart';
import 'package:tasks_app_provider_consumer/database/client_sqlite.dart';
import 'package:tasks_app_provider_consumer/repositories/task_repository_impl.dart';
import 'package:tasks_app_provider_consumer/repositories/user_repository_impl.dart';
import 'package:tasks_app_provider_consumer/services/task_service_impl.dart';
import 'package:tasks_app_provider_consumer/services/user_service_impl.dart';
import 'package:tasks_app_provider_consumer/storage/local_storage_impl.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      
      ChangeNotifierProvider(
        create: (context) => UserController(
          userService: UserServiceImpl(
            userRepository: UserRepositoryImpl(
              clientSqlite: ClientSqlite()
            ),
          ),
          localStorage: LocalStorageImpl(
            key: "user"
          ),
        ),
      ),

      ChangeNotifierProvider(
        create: (context) => TaskController(
          taskService: TaskServiceImpl(
            taskRepository: TaskRepositoryImpl(
              clientSqlite: ClientSqlite()
            ),
          ),
        ),
      ),
    ],
    child: const AppWidget(),
  ));
}