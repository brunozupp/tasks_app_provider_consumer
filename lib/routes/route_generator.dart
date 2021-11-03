import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/models/task.dart';
import 'package:tasks_app_provider_consumer/pages/default/error_page.dart';
import 'package:tasks_app_provider_consumer/pages/default/not_found_page.dart';
import 'package:tasks_app_provider_consumer/pages/login/login_page.dart';
import 'package:tasks_app_provider_consumer/pages/register/register_page.dart';
import 'package:tasks_app_provider_consumer/pages/splash/splash_page.dart';
import 'package:tasks_app_provider_consumer/pages/tasks/task_form_page.dart';
import 'package:tasks_app_provider_consumer/pages/tasks/tasks_list_page.dart';

abstract class RouteGenerator {

  static Route<dynamic> generateRoutes(RouteSettings settings) {

    final args = settings.arguments;

    switch(settings.name) {

      case "/":
        return _goTo(const SplashPage());

      case "/login":
        return _goTo(const LoginPage());

      case "/register":
        return _goTo(const RegisterPage());

      case "/tasks":
        return _goTo(const TasksListPage());

      case "/tasks/form":

        if(args == null || (args is Task)) {
          return _goTo(TaskFormPage(task: args as Task?));
        }

        return _goTo(
          const ErrorPage(text: "Erro na passagem de parâmetros")
        );

      default:
        return _goTo(const NotFoundPage());
    }
  }

  static MaterialPageRoute<dynamic> _goTo(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}