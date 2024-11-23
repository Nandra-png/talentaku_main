import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku/constants/app_colors.dart';
import '../models/login_models.dart';
import '../models/profile_image_picker.dart';
import '../models/text_pair.dart';
import '../models/text_field.dart'; // Import CustomTextFieldModel
import '../views/login/login_pick_image.dart';

class LoginController extends GetxController {
  // Login model for state management
  var loginModel = LoginModel().obs;

  // Controllers for username and password
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Observable for image picked state
  var isImagePicked = false.obs;

  // Function to create a CustomTextPair model
  CustomTextPairModel getCustomTextPair() {
    return CustomTextPairModel(
      primaryText: "Selamat Datang",
      secondaryText: "Semangat buat hari ini ya...",
      primaryStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
      secondaryStyle: TextStyle(fontSize: 16, color: Colors.black),
      alignment: CrossAxisAlignment.start,
    );
  }

  // Function to create CustomTextFieldModel for username
  CustomTextFieldModel getUsernameModel() {
    return CustomTextFieldModel(
      controller: usernameController,
      labelText: 'Username',
      onChanged: (value) => updateCredentials(),
    );
  }

  // Function to create CustomTextFieldModel for password
  CustomTextFieldModel getPasswordModel() {
    return CustomTextFieldModel(
      controller: passwordController,
      labelText: 'Password',
      isPassword: true,
      onChanged: (value) => updateCredentials(),
    );
  }

  // Profile image picker model
  ProfileImagePickerModel getProfileImagePickerModel(BuildContext context) {
    return ProfileImagePickerModel(
      image: isImagePicked.value
          ? AssetImage('')
          : AssetImage(''),
      avatarRadius: 60,
      cameraRadius: 20,
      cameraBackgroundColor: Colors.blue,
      cameraIcon: const Icon(Icons.add_a_photo, color: Colors.white),
      onCameraTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(16),
              height: 230,
              child: Column(
                children: [
                  const Text(
                    "Pilih dari",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildOption(
                        icon: Icons.camera_alt,
                        label: "Camera",
                        onTap: () {
                          Navigator.pop(context);
                          isImagePicked.value = true;
                        },
                      ),
                      buildOption(
                        icon: Icons.photo_library,
                        label: "Gallery",
                        onTap: () {
                          Navigator.pop(context);
                          isImagePicked.value = true;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // Rounded corners for pill shape
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30), // Spacing inside the button
                      elevation: 0, // Remove shadow for a flatter look
                      textStyle: TextStyle(
                        fontSize: 16, // Font size
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  )

                ],
              ),
            );
          },
        );
      },
    );
  }

  // Option for selecting from camera or gallery
  static Widget buildOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    usernameController.addListener(() => updateCredentials());
    passwordController.addListener(() => updateCredentials());
  }

  // Update login model with credentials
  void updateCredentials() {
    loginModel.value.updateLoginState(
      usernameController.text,
      passwordController.text,
    );
  }

  // Validate form login
  bool isValid() {
    return loginModel.value.isValid;
  }

  // Handle login action
  void onLoginPressed(BuildContext context) {
    if (isValid()) {
      Get.to(() => LoginPickImage()); // Navigate to another screen if valid
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Username dan password harus diisi!", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
