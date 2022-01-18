import 'package:flutter/material.dart';

class OutlinedInput extends StatelessWidget {
  const OutlinedInput({
    Key? key,
    required this.label,
    required this.inputType,
    required this.obscureText,
    required this.controller,
    required this.validator,
  }) : super(key: key);
  final String label;
  final TextInputType inputType;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: inputType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.white,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.white,
          ),
        ),
        labelText: label,
        labelStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.white70),
      ),
      style: Theme.of(context).textTheme.bodyText1,
      cursorColor: Colors.white,
      obscureText: obscureText,
    );
  }
}
