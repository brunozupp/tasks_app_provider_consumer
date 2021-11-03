import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_primary_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/password_form_field_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/text_form_field_widget.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recuperar senha"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  const TextFormFieldWidget(
                    label: "Email da conta perdida"
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PasswordFormFieldWidget(
                    label: "Nova senha"
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PasswordFormFieldWidget(
                    label: "Confirme a nova senha"
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonPrimaryWidget(
                    text: "Mudar senha", 
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