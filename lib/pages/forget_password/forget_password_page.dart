import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/view_models/forget_password_view_model.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_primary_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/password_form_field_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/text_form_field_widget.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({ Key? key }) : super(key: key);

  final ForgetPasswordViewModel forgetPasswordViewModel = ForgetPasswordViewModel();

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
              key: forgetPasswordViewModel.formKey,
              child: Column(
                children: [
                  TextFormFieldWidget(
                    label: "Email da conta perdida",
                    controller: forgetPasswordViewModel.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: forgetPasswordViewModel.validateEmail,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordFormFieldWidget(
                    label: "Nova senha",
                    controller: forgetPasswordViewModel.passwordController,
                    validator: forgetPasswordViewModel.validatePassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordFormFieldWidget(
                    label: "Confirme a nova senha",
                    controller: forgetPasswordViewModel.confirmPasswordController,
                    validator: forgetPasswordViewModel.validateConfirmPassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonPrimaryWidget(
                    text: "Mudar senha", 
                    onPressed: () {
                      if(forgetPasswordViewModel.validate()) {
                        Navigator.of(context).pushNamedAndRemoveUntil("/login", (e) => false);
                      }
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