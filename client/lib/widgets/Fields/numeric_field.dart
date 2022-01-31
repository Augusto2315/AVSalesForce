import 'package:flutter/material.dart';

class CustomNumericField extends StatelessWidget {
  const CustomNumericField({
    Key? key,
    required this.controller,
    required this.label,
    this.hint,
  }) : super(key: key);

  final TextEditingController controller;
  final String? hint;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return label;
          }
          return null;
        },
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          hintText: hint,
          labelText: label,
        ),
      ),
    );
  }
}
