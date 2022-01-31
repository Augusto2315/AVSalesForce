import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.inputType,
    this.hint,
    required this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType inputType;
  final String label;
  final String? hint;

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
        keyboardType: inputType,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          hintText: hint,
          labelText: label,
        ),
      ),
    );
  }
}
