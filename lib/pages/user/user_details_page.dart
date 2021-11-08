import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app_provider_consumer/controllers/user_controller.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';
import 'package:tasks_app_provider_consumer/pages/user/components/label_component.dart';
import 'package:tasks_app_provider_consumer/styles/colors_app.dart';
import 'package:tasks_app_provider_consumer/utils/snackbar_utils.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_primary_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_secundary_widget.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Consumer<UserController>(
          builder: (_,controller,child) {

            User user = controller.user!;

            return Column(
              children: [
                LabelComponent(
                  icon: Icons.person, 
                  information: user.name
                ),
                const SizedBox(
                  height: 20,
                ),
                LabelComponent(
                  icon: Icons.email, 
                  information: user.email
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonSecundaryWidget(
                  text: "Editar", 
                  onPressed: () => Navigator.of(context).pushNamed("/user/change-general-information", arguments: user),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}