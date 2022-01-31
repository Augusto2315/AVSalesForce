import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  PasswordField({
    Key? key,
    required this.controller,
    required this.inputType,
    this.hint,
    required this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType inputType;
  final String? hint;
  final String label;
  late bool isObscure = true;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.label;
          }
          return null;
        },
        controller: widget.controller,
        keyboardType: widget.inputType,
        obscureText: widget.isObscure,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          hintText: widget.hint,
          labelText: widget.label,
          suffixIcon: IconButton(
            icon: Icon(
                widget.isObscure ? Icons.visibility : Icons.visibility_off),
            onPressed: () => {
              setState(
                () {
                  widget.isObscure = !widget.isObscure;
                },
              ),
            },
          ),
        ),
      ),
    );
  }
}
