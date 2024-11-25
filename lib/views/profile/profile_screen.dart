import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_sizes.dart';
import '../../controllers/profile_controller.dart';
import '../../controllers/login_controller.dart';
import '../../widgets/custom_text_pair.dart';
import '../../widgets/login_button.dart';
import '../../widgets/profile_image.dart';
import '../../widgets/profile_widgets.dart';
import '../../widgets/welcome_sign.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    final loginController = Get.put(LoginController());

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.paddingXS),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.spaceXL),
              const WelcomeSign(),

              const SizedBox(height: AppSizes.spaceL),

              // ProfileImagePicker
              ProfileImagePicker(
                model: loginController.getProfileImagePickerModel(context),
              ),

              const SizedBox(height: AppSizes.spaceXS),

              // CustomTextPairWidget
              CustomTextPairWidget(
                model: loginController.getCustomTextPair(),
              ),

              const SizedBox(height: AppSizes.spaceM),

              // Row to display name and NIS in a single row
              // Row to display name and NIS in a single row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: AppSizes.profile,
                    child: TextPairWidget(
                      icon: Icons.list_alt,
                      model: profileController.getTextPair('NIS'),
                      boxStyle: BoxStyle.border,
                    ),
                  ),
                  const SizedBox(width: AppSizes.spaceS),
                  Container(
                    width: AppSizes.profile,
                    child: TextPairWidget(
                      icon: Icons.list_alt,
                      model: profileController.getTextPair('Kelompok'),
                      boxStyle: BoxStyle.border,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.spaceM),

              // Additional profile info
              Obx(() {
                return Column(
                  children: [
                    TextPairWidget(
                      model: profileController.getTextPair('Nama Lengkap'),
                    ),
                    const SizedBox(height: AppSizes.spaceS),
                    TextPairWidget(
                      model: profileController
                          .getTextPair('Tempat, Tanggal Lahir'),
                    ),
                    const SizedBox(height: AppSizes.spaceS),
                    TextPairWidget(
                      model: profileController.getTextPair('Alamat'),
                    ),
                    const SizedBox(height: AppSizes.spaceS),
                  ],
                );
              }),

              const SizedBox(height: AppSizes.spaceM),

              // Logout Button
              SizedBox(
                width: 150,
                child: ReusableButton(
                  buttonText: "Logout",
                  icon: Icons.logout,
                  onPressed: () {
                    loginController.onLogoutPressed(context);
                  },
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
