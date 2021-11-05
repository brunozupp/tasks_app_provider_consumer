import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/models/task.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';
import 'package:tasks_app_provider_consumer/pages/dashboard/dashboard_page.dart';
import 'package:tasks_app_provider_consumer/pages/default/error_page.dart';
import 'package:tasks_app_provider_consumer/pages/default/not_found_page.dart';
import 'package:tasks_app_provider_consumer/pages/forget_password/forget_password_page.dart';
import 'package:tasks_app_provider_consumer/pages/login/login_page.dart';
import 'package:tasks_app_provider_consumer/pages/register/register_page.dart';
import 'package:tasks_app_provider_consumer/pages/splash/splash_page.dart';
import 'package:tasks_app_provider_consumer/pages/tasks/task_form_page.dart';
import 'package:tasks_app_provider_consumer/pages/tasks/tasks_list_page.dart';
import 'package:tasks_app_provider_consumer/pages/user/user_details_page.dart';
import 'package:tasks_app_provider_consumer/pages/user/user_form_general_information_page.dart';

abstract class RouteGenerator {

  static Route<dynamic> generateRoutes(RouteSettings settings) {

    final args = settings.arguments;

    switch(settings.name) {

      case "/":
        return _goTo(const SplashPage());

      case "/login":
        return _goTo(LoginPage());

      case "/forget-password":
        return _goTo(ForgetPasswordPage());

      case "/register":
        return _goTo(RegisterPage());

      case "/tasks":
        return _goTo(const TasksListPage());

      case "/tasks/form":

        if(args == null || (args is Task)) {
          return _goTo(TaskFormPage(task: args as Task?));
        }
      
        return _goTo(
          const ErrorPage(text: "Erro na passagem de parâmetros")
        );
      
      case "/dashboard":
        return _goTo(const DashboardPage());

      case "/user":
        return _goTo(const UserDetailsPage());

      case "/user/change-general-information":

        if(args == null || (args is User)) {
          return _goTo(UserFormGeneralInformationPage(user: args as User));
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