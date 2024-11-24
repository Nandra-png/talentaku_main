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

            // Filter Dropdown
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
              child: Theme(
                data: Theme.of(context).copyWith(
                  // Kustomisasi popup menu
                  popupMenuTheme: PopupMenuThemeData(
                    color: AppColors.cardBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusL),
                    ),
                  ),
                ),
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
                  child: Obx(() => DropdownButtonFormField<String>(
                    value: controller.selectedFilter.value,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSizes.paddingL,
                        vertical: AppSizes.paddingM,
                      ),
                      // Menambahkan icon filter
                      prefixIcon: Icon(
                        Icons.filter_list,
                        color: AppColors.primary,
                      ),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.primary,
                    ),
                    style: AppTextStyles.bodyMedium,
                    dropdownColor: AppColors.cardBackground,
                    // Kustomisasi item dropdown
                    selectedItemBuilder: (context) {
                      return controller.filterOptions.map((String value) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            value,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        );
                      }).toList();
                    },
                    items: controller.filterOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSizes.radiusM),
                          ),
                          child: Row(
                            children: [
                              // Icon untuk setiap opsi
                              Icon(
                                value == 'Semua Laporan'
                                    ? Icons.list_alt
                                    : value == '7 Hari Terakhir'
                                        ? Icons.date_range
                                        : Icons.calendar_today,
                                color: AppColors.primary,
                                size: AppSizes.iconM,
                              ),
                              SizedBox(width: AppSizes.paddingM),
                              Text(
                                value,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) controller.filterLaporan(value);
                    },
                    // Menambahkan animasi saat dropdown dibuka/ditutup
                    menuMaxHeight: 300,
                    elevation: 8,
                    isExpanded: true,
                  )),
                ),
              ),
            ),
            SizedBox(height: AppSizes.spaceM),

            // Laporan List
            Expanded(
              child: Obx(() {
                if (controller.filteredLaporan.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/logo.png',
                          width: AppSizes.iconL * 3,
                          height: AppSizes.iconL * 3,
                        ),
                        SizedBox(height: AppSizes.spaceM),
                        Text(
                          'Tidak ada laporan pada periode ini',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textPrimary.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                  itemCount: controller.filteredLaporan.length,
                  itemBuilder: (context, index) {
                    return LaporanSiswaCard(
                      laporan: controller.filteredLaporan[index],
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
