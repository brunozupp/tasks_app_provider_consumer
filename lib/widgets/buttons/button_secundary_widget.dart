import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/styles/colors_app.dart';

class ButtonSecundaryWidget extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const ButtonSecundaryWidget({ 
    Key? key,
    required this.text,
    required this.onPressed 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        child: Text(
          text,
        ),
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          side: MaterialStateProperty.all(
            const BorderSide(
              color: ColorsApp.primaryColor
            )
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if(states.contains(MaterialState.disabled)) return Colors.grey;
            if(states.contains(MaterialState.pressed)) return ColorsApp.primaryColor.withAlpha(25);

            return Colors.white;
          }),
          textStyle: MaterialStateProperty.resolveWith((states) {
            if(states.contains(MaterialState.pressed)) {
              return TextStyle(
                fontSize: 18,
                foreground: Paint()..color = ColorsApp.primaryColor,
              );
            }

            return TextStyle(
              fontSize: 16,
              foreground: Paint()..color = ColorsApp.primaryColor,
            );
          }),
        ),
      ),
    );
  }
}