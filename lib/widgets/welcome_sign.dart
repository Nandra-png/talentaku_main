import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku/constants/app_colors.dart';
import 'package:talentaku/constants/app_text_styles.dart';
import 'package:talentaku/constants/app_sizes.dart';
import 'package:talentaku/constants/app_decorations.dart';
import '../controllers/home_controller.dart';
import '../views/notification/notification_screen.dart';

class WelcomeSign extends StatelessWidget {
  const WelcomeSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Container(
      width: double.infinity,
      height: AppSizes.welcomeSignHeight,
      margin: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: AppSizes.welcomeSignHeight,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: AppSizes.logoSize + AppSizes.paddingXL,
              top: AppSizes.paddingXL,
            ),
            child: Text(
              'Selamat Pagi,',
              style: AppTextStyles.bodySmall,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: AppSizes.logoSize + AppSizes.paddingXL,
              top: AppSizes.paddingXL + AppSizes.paddingL,
            ),
            child: Text(
              controller.userName,
              style: AppTextStyles.heading1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: AppSizes.paddingXL,
              top: AppSizes.paddingL,
            ),
            child: Container(
              width: AppSizes.logoSize,
              height: AppSizes.logoSize,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("images/logo.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: AppSizes.paddingL,
            child: GestureDetector(
              onTap: () => Get.to(() => const NotificationScreen()),
              child: Container(
                width: AppSizes.notificationIconSize,
                height: AppSizes.notificationIconSize,
                decoration: AppDecorations.notificationButtonDecoration,
                child: Icon(
                  Icons.notifications,
                  size: AppSizes.iconL,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
