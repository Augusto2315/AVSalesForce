import 'package:flutter/material.dart';

class ButtonDeny extends StatelessWidget {
  const ButtonDeny({Key? key, required this.onClick}) : super(key: key);
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton.icon(
        onPressed: () => onClick.call(),
        icon: const Icon(Icons.close),
        label: const Text("Não"),
        style: ElevatedButton.styleFrom(
          primary: colors.error,
          elevation: 8,
          minimumSize: const Size(120, 45),
        ),
      ),
    );
  }
}
