import 'package:flutter/material.dart';
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
        child: Column(
          children: const [
            LabelComponent(
              icon: Icons.person, 
              information: "Bruno Aparecido Zupp Noveli"
            ),
            SizedBox(
              height: 20,
            ),
            LabelComponent(
              icon: Icons.email, 
              information: "brunozuppnoveli@gmail.com"
            ),
          ],
        ),
      ),
    );
  }
}