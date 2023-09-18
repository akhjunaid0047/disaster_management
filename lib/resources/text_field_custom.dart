import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintext;
  final TextInputType textInputType;
  const TextFieldInput(
      {required this.textEditingController,
      this.isPass = false,
      required this.hintext,
      required this.textInputType,
      super.key});

  @override
  Widget build(BuildContext context) {
    final inputborder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context),
        borderRadius: BorderRadius.circular(30.0));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 142, 213, 244),
        hintText: hintext,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 86, 151, 187),
        ),
        border: inputborder,
        focusedBorder: inputborder,
        enabledBorder: inputborder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
