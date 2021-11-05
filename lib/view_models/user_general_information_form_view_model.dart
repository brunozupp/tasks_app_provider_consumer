import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';

import 'base_view_model.dart';

class UserGeneralInformationFormViewModel extends BaseViewModel {
  
  late final int id;
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  UserGeneralInformationFormViewModel(User user) {
    id = user.id!;
    nameController.text = user.name;
    emailController.text = user.email;
  }

  String? validateName(String? value) {
    if(value == null || value.isEmpty) {
      return "Campo obrigatório";
    }

    RegExp regExp = RegExp(r"[0-9]");

    if(regExp.hasMatch(value)) {
      return "Nome não pode conter números, apenas letras";
    }

    return null;
  }

  String? validateEmail(String? value) {
    if(value == null || value.isEmpty) {
      return "Campo obrigatório";
    }

    RegExp regExp = RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if(!regExp.hasMatch(value)) {
      return "Email não é válido";
    }

    return null;
  }
}