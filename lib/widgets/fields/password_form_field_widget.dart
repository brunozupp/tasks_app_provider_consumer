import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/styles/colors_app.dart';

class PasswordFormFieldWidget extends StatelessWidget {

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String label;

  const PasswordFormFieldWidget({ 
    Key? key,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.primaryColor
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.errorColor
          ),
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: ColorsApp.primaryColor
        )
      ),
    );
  }
}