import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/routes/route_generator.dart';
import 'package:tasks_app_provider_consumer/styles/themes_app.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks App',
      theme: ThemesApp.primary,
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      onGenerateRoute: RouteGenerator.generateRoutes,
    );
  }
}