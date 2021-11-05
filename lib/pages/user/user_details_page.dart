import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app_provider_consumer/controllers/user_controller.dart';
import 'package:tasks_app_provider_consumer/models/user.dart';
import 'package:tasks_app_provider_consumer/pages/user/components/label_component.dart';
import 'package:tasks_app_provider_consumer/styles/colors_app.dart';

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
              ],
            );
          },
        ),
      ),
    );
  }
}