import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku/constants/app_colors.dart';
import 'package:talentaku/constants/app_text_styles.dart';
import 'package:talentaku/constants/app_sizes.dart';
import 'package:talentaku/controllers/laporan_siswa_controller.dart';
import 'package:talentaku/widgets/welcome_sign.dart';
import 'package:talentaku/widgets/laporan_siswa_card.dart';

class LaporanSiswaScreen extends StatelessWidget {
  const LaporanSiswaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LaporanSiswaController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppSizes.spaceL),
            const WelcomeSign(),
            SizedBox(height: AppSizes.spaceL),

            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(AppSizes.radiusL),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: controller.searchLaporan,
                  decoration: controller.searchDecoration,
                ),
              ),
            ),
            SizedBox(height: AppSizes.spaceS),

            // Search Status
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
              child: Obx(() => controller.searchStatus.isNotEmpty
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.searchStatus,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    )
                  : const SizedBox()),
            ),
            SizedBox(height: AppSizes.spaceM),

            // Laporan List
            Expanded(
              child: Obx(() {
                if (controller.isSearching.value &&
                    controller.filteredLaporan.isEmpty) {
                  return controller.emptyStateWidget;
                }
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                  itemCount: controller.filteredLaporan.length,
                  itemBuilder: (context, index) {
                    return LaporanSiswaCard(
                      laporan:
                          controller.filteredLaporan.reversed.toList()[index],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
