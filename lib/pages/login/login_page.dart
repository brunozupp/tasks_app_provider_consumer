import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/styles/colors_app.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_primary_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_secundary_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/password_form_field_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/text_form_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        color: ColorsApp.primaryColor,
                        fontSize: 36,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 40,
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
                      text: "Entrar", 
                      onPressed: () {
                        print("ddd");
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 2,
                          )
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10
                          ),
                          child: const Text(
                            "Não possui uma conta?"
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonSecundaryWidget(
                      text: "Entrar", 
                      onPressed: () {
                        print("dddwewe");
                      },
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}