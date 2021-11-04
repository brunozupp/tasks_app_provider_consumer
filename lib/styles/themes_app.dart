import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/styles/colors_app.dart';

abstract class ThemesApp {

  static ThemeData get primary => ThemeData(
    primaryColor: ColorsApp.primaryColor,
    backgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: ColorsApp.primaryColor,
      centerTitle: true
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsApp.primaryColor
    ),
  ); 
}