import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app_provider_consumer/controllers/user_controller.dart';
import 'package:tasks_app_provider_consumer/pages/dashboard/dashboard_page.dart';
import 'package:tasks_app_provider_consumer/pages/default/error_page.dart';
import 'package:tasks_app_provider_consumer/pages/login/login_page.dart';
import 'package:tasks_app_provider_consumer/styles/colors_app.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: isLogged(context),
        builder: (context,snapshot) {

          if(snapshot.hasError) {
            return const ErrorPage(text: "Erro na inicialização do app");
          }

          if(snapshot.hasData) {
            return snapshot.data! ? const DashboardPage() : LoginPage();
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.task,
                  size: 100,
                  color: ColorsApp.primaryColor,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Aplicativo de tarefas",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<bool> isLogged(BuildContext context) async {
    final value = (await Future.wait([
      Provider.of<UserController>(context).isLogged(),
      Future.delayed(const Duration(seconds: 2))
    ]))[0] as bool;

    return value;
  }
}