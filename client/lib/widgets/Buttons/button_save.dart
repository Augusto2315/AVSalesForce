import 'package:flutter/material.dart';

class ButtonSave extends StatelessWidget {
  const ButtonSave({Key? key, required this.onClick}) : super(key: key);
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton.icon(
        onPressed: () => onClick.call(),
        icon: const Icon(Icons.done),
        label: const Text("Salvar"),
        style: ElevatedButton.styleFrom(
          primary: colors.primary,
          elevation: 8,
          minimumSize: const Size(120, 45),
        ),
      ),
    );
  }
}
