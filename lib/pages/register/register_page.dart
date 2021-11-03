import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/styles/colors_app.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_primary_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/password_form_field_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/text_form_field_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar conta"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  const TextFormFieldWidget(
                    label: "Nome"
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextFormFieldWidget(
                    label: "Email"
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PasswordFormFieldWidget(
                    label: "Senha"
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonPrimaryWidget(
                    text: "Registrar", 
                    onPressed: () {
                      print("ddd");
                    },
                  ),
                  
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}