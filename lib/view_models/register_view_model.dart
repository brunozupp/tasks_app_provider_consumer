import 'package:flutter/material.dart';

import 'base_view_model.dart';

class RegisterViewModel extends BaseViewModel {
  
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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

    RegExp regExp = RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\$');

    if(regExp.hasMatch(value)) {
      return "Email não é válido";
    }

    return null;
  }

  String? validatePassword(String? value) {
    if(value == null || value.isEmpty) {
      return "Campo obrigatório";
    }

    if(value.length != 6) {
      return "Senha deve ter 6 caracteres";
    }

    RegExp regExpLetter = RegExp(r'[a-zA-Z]');

    if(!regExpLetter.hasMatch(value)) {
      return "Senha deve conter no mínimo uma letra";
    }

    RegExp regExpNumber = RegExp(r'[0-9]');

    if(!regExpNumber.hasMatch(value)) {
      return "Senha deve conter no mínimo um número";
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if(value != passwordController.text) {
      return "Campo deve ser igual ao informado no campo de senha";
    }

    return null;
  }
}