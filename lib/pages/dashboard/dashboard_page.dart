import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app_provider_consumer/controllers/user_controller.dart';
import 'package:tasks_app_provider_consumer/pages/dashboard/components/card_dashboard.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        automaticallyImplyLeading: false,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          CardDashboard(
            text: "Perfil", 
            icon: Icons.person, 
            onTap: () => Navigator.of(context).pushNamed("/user"),
          ),
          CardDashboard(
            text: "Atividades", 
            icon: Icons.task, 
            onTap: () => Navigator.of(context).pushNamed("/tasks"),
          ),
          CardDashboard(
            text: "Sair", 
            icon: Icons.exit_to_app, 
            onTap: () async {
              await Provider.of<UserController>(context, listen: false).logout();
              Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false);
            }
          ),
        ],
      ),
    );
  }
}