import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
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
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: AppSizes.paddingL, // Menambah padding vertikal
          horizontal: AppSizes.paddingL // Menambah padding horizontal
        ),
      ),
      style: TextStyle(
        fontSize: AppSizes.spaceM, // Misalnya, ukuran font menengah
      ),
    );
  }
}