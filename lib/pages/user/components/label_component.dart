import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/styles/colors_app.dart';

class LabelComponent extends StatelessWidget {

  final IconData icon;
  final String information;

  const LabelComponent({ 
    Key? key, 
    required this.icon, 
    required this.information 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsApp.primaryColor
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: ColorsApp.primaryColor,
            size: 32,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              information,
              style: const TextStyle(
                fontSize: 16
              ),
            )
          ),
        ],
      ),
    );
  }
}