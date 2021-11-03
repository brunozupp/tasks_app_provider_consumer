import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/styles/colors_app.dart';

class TextareaFormFieldWidget extends StatelessWidget {

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String label;

  const TextareaFormFieldWidget({ 
    Key? key,
    this.controller,
    this.validator,
    this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: null,
      validator: validator,
      onChanged: onChanged,
      keyboardType: TextInputType.multiline,
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