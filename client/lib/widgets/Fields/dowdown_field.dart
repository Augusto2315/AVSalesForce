import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown(
      {Key? key,
      required this.valorAtual,
      required this.hintText,
      required this.desktop,
      required this.onchanged,
      required this.items})
      : super(key: key);

  final dynamic valorAtual;
  final String hintText;
  final bool desktop;
  final Function onchanged;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 8.0),
      child: DropdownButton<Object>(
        hint: Text(
          hintText,
        ),
        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: true,
        items: items
            .map((item) => DropdownMenuItem<Object>(
                  value: item,
                  child: Text(
                    item.toString(),
                  ),
                ))
            .toList(),
        value: valorAtual,
        onChanged: (value) => onchanged(value).call(),
      ),
    );
  }
}
