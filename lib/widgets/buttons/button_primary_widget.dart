import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/styles/colors_app.dart';

class ButtonPrimaryWidget extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const ButtonPrimaryWidget({ 
    Key? key,
    required this.text,
    required this.onPressed 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: Text(
          text,
        ),
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if(states.contains(MaterialState.disabled)) return Colors.grey;
            if(states.contains(MaterialState.pressed)) return Colors.purple.shade700;

            return ColorsApp.primaryColor;
          }),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
            if(states.contains(MaterialState.pressed)) {
              return const TextStyle(
                fontSize: 18
              );
            }

            return const TextStyle(
              fontSize: 16
            );
          }),
        ),
      ),
    );
  }
}