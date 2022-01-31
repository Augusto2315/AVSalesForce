import 'package:flutter/material.dart';
import 'package:salesforce/widgets/Buttons/button_confirmation.dart';
import 'package:salesforce/widgets/Buttons/button_deny.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    Key? key,
    required this.onConfirm,
    required this.onDeny,
  }) : super(key: key);

  final Function onConfirm;
  final Function onDeny;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Deseja excluir o Grupo?",
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        ButtonConfirm(
          onClick: () => onConfirm.call(),
        ),
        ButtonDeny(
          onClick: () => onDeny.call(),
        ),
      ],
    );
  }
}
