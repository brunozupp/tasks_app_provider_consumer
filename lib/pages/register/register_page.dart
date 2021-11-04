import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/view_models/register_view_model.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_primary_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/password_form_field_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/text_form_field_widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({ Key? key }) : super(key: key);

  final RegisterViewModel registerVM = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar conta"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: registerVM.formKey,
          child: Column(
            children: [
              TextFormFieldWidget(
                label: "Nome",
                controller: registerVM.nameController,
                keyboardType: TextInputType.name,
                validator: registerVM.validateName,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                label: "Email",
                controller: registerVM.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: registerVM.validateEmail,
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordFormFieldWidget(
                label: "Senha",
                controller: registerVM.passwordController,
                validator: registerVM.validatePassword,
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordFormFieldWidget(
                label: "Confirme a senha",
                controller: registerVM.confirmPasswordController,
                validator: registerVM.validateConfirmPassword,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonPrimaryWidget(
                text: "Registrar", 
                onPressed: () {
                  if(registerVM.validate()) {
                    Navigator.of(context).pushNamedAndRemoveUntil("/dashboard", (e) => false);
                  }
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}