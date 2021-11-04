import 'package:flutter/cupertino.dart';

import 'base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(String? value) {
    if(value == null || value.isEmpty) {
      return "Campo obrigatório";
    }

    return null;
  }

  String? validatePassword(String? value) {
    if(value == null || value.isEmpty) {
      return "Campo obrigatório";
    }

    return null;
  }
}