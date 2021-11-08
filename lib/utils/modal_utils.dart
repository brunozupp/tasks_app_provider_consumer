import 'package:flutter/material.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_primary_widget.dart';
import 'package:tasks_app_provider_consumer/widgets/buttons/button_secundary_widget.dart';

abstract class ModalUtils {

  static Future<bool?> showModalConfirmation(BuildContext context, {String? message}) async {
    return await showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message ?? "Você confirma a ação?"),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonPrimaryWidget(
                    text: "Não", 
                    onPressed: () => Navigator.of(context).pop(false), 
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ButtonSecundaryWidget(
                    text: "Sim", 
                    onPressed: () => Navigator.of(context).pop(true), 
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}