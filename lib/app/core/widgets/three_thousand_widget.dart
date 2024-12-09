import 'package:flutter/material.dart';

class ThreeThousandWidget extends StatelessWidget {
  final String label;
  final IconButton? suffixIconButton;
  final bool obscureText;
  final bool obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusnode;

  const ThreeThousandWidget({
    super.key,
    required this.label,
    this.suffixIconButton,
    this.obscureText = false,
    this.obscureTextVN = false,
    this.controller,
    this.validator,
    this.focusnode,
  }) : assert(
          obscureText == true ? suffixIconButton == null : true,
          'obscureText não pode ser enviado em conjunto com o suffixIconButton',
        );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      focusNode: focusnode,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red),
        ),
        isDense: true,
      ),
      obscureText: false,
    );
  }
}
