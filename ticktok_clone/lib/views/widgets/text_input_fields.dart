import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ticktok_clone/constants/constants.dart';

class TextInputField extends StatelessWidget {
  final String lebelText;
  final TextEditingController controller;
  final IconData prefixIconData;
  final bool isObscure;
  const TextInputField(
      {super.key,
      required this.lebelText,
      required this.controller,
      required this.prefixIconData,
      this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        // label: Text(lebelText),
        labelText: lebelText,
        labelStyle: TextStyle(fontSize: 20),
        prefixIcon: Icon(prefixIconData),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: borderColor),
        ),
      ),
      obscureText: isObscure,
    );
  }
}
