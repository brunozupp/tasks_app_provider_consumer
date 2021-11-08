import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app_provider_consumer/controllers/user_controller.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';
import 'package:tasks_app_provider_consumer/utils/snackbar_utils.dart';
import 'package:tasks_app_provider_consumer/view_models/user_general_information_form_view_model.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_primary_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/fields/text_form_field_widget.dart';

class UserFormGeneralInformationPage extends StatelessWidget {

  final User user;

  UserFormGeneralInformationPage({ 
    Key? key,
    required this.user 
  }) : super(key: key) {
    userGeneralInformationFormVM = UserGeneralInformationFormViewModel(user);
  }

  late final UserGeneralInformationFormViewModel userGeneralInformationFormVM;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar perfil"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: userGeneralInformationFormVM.formKey,
          child: Column(
            children: [
              TextFormFieldWidget(
                label: "Nome",
                controller: userGeneralInformationFormVM.nameController,
                keyboardType: TextInputType.name,
                validator: userGeneralInformationFormVM.validateName,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                label: "Email",
                controller: userGeneralInformationFormVM.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: userGeneralInformationFormVM.validateEmail,
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<UserController>(
                builder: (_,controller,child) {
                  return ButtonPrimaryWidget(
                    loading: controller.loading,
                    text: "Editar", 
                    onPressed: () async {

                      final result = await controller.changeGeneralInformation(userGeneralInformationFormVM);

                      SnackbarUtils.showSnackbarStatusResponse(context: context, statusResponse: result);

                      if(result.isSuccess) {
                        Navigator.of(context).pop();
                      }
                      
                    },
                  );
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}