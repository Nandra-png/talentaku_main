import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku/constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import '../../controllers/login_controller.dart';
import '../../widgets/custom_text_pair.dart';
import '../../widgets/custom_text_field.dart'; // Import custom text field

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.backgroundLogin,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Image.asset("images/logo.png"),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      // CustomTextPairWidget
                      CustomTextPairWidget(
                        model: controller.getCustomTextPair(),
                      ),

                      SizedBox(height: AppSizes.spaceXL),

                      // Username input field menggunakan CustomTextFieldWidget
                      CustomTextFieldWidget(model: controller.getUsernameModel()),

                      SizedBox(height: AppSizes.spaceXL),

                      // Password input field menggunakan CustomTextFieldWidget
                      CustomTextFieldWidget(model: controller.getPasswordModel()),

                      SizedBox(height: AppSizes.spaceXL),
                      // Login button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                        onPressed: () {
                          controller.onLoginPressed(context);
                        },
                        child: Text('Login', style: TextStyle(color: AppColors.textLight)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
