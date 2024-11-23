import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talentaku/constants/app_colors.dart';
import 'package:talentaku/views/login/login.dart';
import '../constants/app_sizes.dart';
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
  var profileImage = ''.obs; // Store the picked image path

  // Function to create a CustomTextPair model
  CustomTextPairModel getPair() {
    return CustomTextPairModel(
      primaryText: "Selamat Datang",
      secondaryText: "Semangat buat hari ini ya...",
      primaryStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
      secondaryStyle: TextStyle(fontSize: 16, color: Colors.black),
      alignment: CrossAxisAlignment.start,
    );
  }

  // Function to create a CustomTextPair model
  CustomTextPairModel getCustomTextPair() {
    return CustomTextPairModel(
      primaryText: "Narendra",
      secondaryText: "Siswa KB",
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
          ? AssetImage(profileImage.value) // Use the selected image
          : AssetImage('assets/default_avatar.png'), // Use default avatar if no image selected
      avatarRadius: 60,
      cameraRadius: 20,
      cameraBackgroundColor: Colors.blue,
      cameraIcon: Icon(Icons.add_a_photo, color: AppColors.textLight),
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
                  SizedBox(height: AppSizes.spaceXL),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildOption(
                        icon: Icons.camera_alt,
                        label: "Camera",
                        onTap: () {
                          Navigator.pop(context);
                          pickImageFromCamera(context);  // Open camera when Camera is selected
                        },
                      ),
                      buildOption(
                        icon: Icons.photo_library,
                        label: "Gallery",
                        onTap: () {
                          Navigator.pop(context);
                          pickImageFromGallery(context); // Open gallery when Gallery is selected
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Function to pick image from Camera
  Future<void> pickImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();

    // Pick image from the camera
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // If an image is picked, you can handle the image file here
      profileImage.value = pickedFile.path;
      isImagePicked.value = true;
      print("Image picked: ${pickedFile.path}");
      // Optionally, you can also show the image preview in the UI here
    } else {
      // Handle case when user cancels camera action
      print("No image selected.");
    }
  }

  // Function to pick image from Gallery
  Future<void> pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();

    // Pick image from gallery
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // If an image is picked, update the state with the selected image
      profileImage.value = pickedFile.path;
      isImagePicked.value = true;
      print("Image picked from gallery: ${pickedFile.path}");
    } else {
      // Handle case when user cancels gallery action
      print("No image selected.");
    }
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
      Get.to(() => LoginPickImage());
    } else {
      Get.snackbar(
        'Error',
        'Username dan password harus diisi!',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(AppSizes.paddingXL),
      );
    }
  }

  // Reset the form fields
  void resetForm() {
    usernameController.clear();
    passwordController.clear();
    isImagePicked.value = false;  // Reset the image picker state
    profileImage.value = '';  // Clear the image path
  }

  // Handle logout action
  void onLogoutPressed(BuildContext context) {
    // Show logout confirmation snack bar
    Get.snackbar(
      'Anda Berhasil Logout',
      'Anda telah keluar dari akun Anda.',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(AppSizes.paddingXL),
    );
    resetForm();
    Get.offAll(() => LoginScreen());
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
