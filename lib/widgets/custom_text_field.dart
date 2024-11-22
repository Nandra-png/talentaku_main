import 'package:flutter/material.dart';
import '../models/text_field.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final CustomTextFieldModel model;

  const CustomTextFieldWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: model.controller,
      obscureText: model.isPassword,
      keyboardType: model.keyboardType,
      onChanged: model.onChanged,
      decoration: InputDecoration(
        labelText: model.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }
}
