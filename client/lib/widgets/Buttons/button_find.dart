import 'package:flutter/material.dart';

class ButtonFind extends StatelessWidget {
  const ButtonFind({Key? key, required this.onClick}) : super(key: key);
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton.icon(
        onPressed: () => onClick.call(),
        icon: const Icon(Icons.search),
        label: const Text("Consultar"),
        style: ElevatedButton.styleFrom(
          primary: colors.secondary,
          elevation: 8,
          minimumSize: const Size(120, 45),
        ),
      ),
    );
  }
}
