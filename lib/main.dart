import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/routes/route_generator.dart';
import 'package:tasks_app_provider_consumer/styles/themes_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemesApp.primary,
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      onGenerateRoute: RouteGenerator.generateRoutes,
    );
  }
}