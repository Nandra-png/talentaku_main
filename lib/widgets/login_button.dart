// widgets/reusable_button.dart
import 'package:flutter/material.dart';
import 'package:talentaku/constants/app_colors.dart';

import '../models/button_login.dart';

class ReusableButton extends StatelessWidget {
  final ReusableButtonModel model;

  const ReusableButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 50,
      onPressed: () {
        // Navigate to the target screen when button is clicked
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => model.targetScreen),
        );
      },
      color: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            model.buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 10),
          const Icon(
            size: 20,
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
