import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/pages/dashboard/components/card_dashboard.dart';
import 'package:tasks_app_provider_consumer/styles/colors_app.dart';

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
            onTap: () {}
          ),
          CardDashboard(
            text: "Atividades", 
            icon: Icons.task, 
            onTap: () {}
          ),
        ],
      ),
    );
  }
}