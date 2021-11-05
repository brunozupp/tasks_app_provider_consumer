import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app_provider_consumer/controllers/user_controller.dart';
import 'package:tasks_app_provider_consumer/styles/colors_app.dart';
import 'package:tasks_app_provider_consumer/utils/snackbar_utils.dart';
import 'package:tasks_app_provider_consumer/view_models/login_view_model.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_primary_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_secundary_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/password_form_field_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/text_form_field_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({ Key? key }) : super(key: key);

  final LoginViewModel loginVM = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                key: loginVM.formKey,
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
                    TextFormFieldWidget(
                      label: "Email",
                      controller: loginVM.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: loginVM.validateEmail,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordFormFieldWidget(
                      label: "Senha",
                      controller: loginVM.passwordController,
                      validator: loginVM.validatePassword,
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: const Text(
                          "Esqueci minha senha",
                          style: TextStyle(
                            color: ColorsApp.primaryColor
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                            if(states.contains(MaterialState.pressed)) return ColorsApp.primaryColor.withAlpha(25);

                            return Colors.white;
                          }),
                        ),
                        onPressed: () => Navigator.of(context).pushNamed("/forget-password"), 
                      ),
                    ),
                    ButtonPrimaryWidget(
                      text: "Entrar", 
                      onPressed: () async {
                        final result = await Provider.of<UserController>(context, listen: false).login(loginVM);

                        if(result.isError) {
                          SnackbarUtils.showSnackbarStatusResponse(context: context, statusResponse: result);
                          return;
                        }

                        Navigator.of(context).pushNamedAndRemoveUntil("/dashboard", (e) => false);
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
                      text: "Criar conta", 
                      onPressed: () => Navigator.of(context).pushNamed("/register")
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