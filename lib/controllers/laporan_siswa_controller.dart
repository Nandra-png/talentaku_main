import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku/models/laporan_preview_event.dart';
import 'package:talentaku/constants/app_colors.dart';
import 'package:talentaku/constants/app_text_styles.dart';
import 'package:talentaku/constants/app_sizes.dart';

class LaporanSiswaController extends GetxController {
  // Untuk search functionality
  final RxString searchQuery = ''.obs;
  final RxList<LaporanPreviewEvent> filteredLaporan =
      <LaporanPreviewEvent>[].obs;
  final RxBool isSearching = false.obs;

  // Dummy data laporan
  final List<LaporanPreviewEvent> allLaporan = [
    LaporanPreviewEvent(
      title: 'Laporan Harian - Senin',
      date: '12 Maret 2024',
      description:
          'Hari ini siswa menunjukkan kemajuan yang baik dalam pembelajaran. Aktif berpartisipasi dalam kegiatan kelas dan mampu menyelesaikan tugas dengan baik.',
    ),
    LaporanPreviewEvent(
      title: 'Laporan Harian - Selasa',
      date: '13 Maret 2024',
      description:
          'Siswa mengikuti kegiatan belajar dengan antusias. Mampu berinteraksi dengan teman-teman dan menunjukkan sikap yang positif.',
    ),
    LaporanPreviewEvent(
      title: 'Laporan Harian - Rabu',
      date: '14 Maret 2024',
      description:
          'Perkembangan motorik halus semakin membaik. Siswa dapat mengikuti instruksi dengan baik dan menyelesaikan kegiatan tepat waktu.',
    ),
  
  ];

  // Search Field Decoration
  InputDecoration get searchDecoration => InputDecoration(
        hintText: 'Cari laporan...',
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textPrimary.withOpacity(0.5),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.textPrimary.withOpacity(0.5),
        ),
        suffixIcon: Obx(() => isSearching.value
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: clearSearch,
                color: AppColors.textPrimary.withOpacity(0.5),
              )
            : const SizedBox()),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingL,
          vertical: AppSizes.paddingM,
        ),
      );

  // Empty State Widget
  Widget get emptyStateWidget => Center(
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
              'Tidak ada laporan yang ditemukan',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textPrimary.withOpacity(0.5),
              ),
            ),
          ],
        ),
      );

  @override
  void onInit() {
    super.onInit();
    filteredLaporan.value = allLaporan;
  }

  // Method untuk search functionality
  void searchLaporan(String query) {
    searchQuery.value = query;
    isSearching.value = query.isNotEmpty;

    if (query.isEmpty) {
      filteredLaporan.value = allLaporan;
      return;
    }

    final String normalizedQuery = query.toLowerCase().trim();

    filteredLaporan.value = allLaporan.where((laporan) {
      final String normalizedTitle = laporan.title.toLowerCase();
      final String normalizedDesc = laporan.description.toLowerCase();
      final String normalizedDate = laporan.date.toLowerCase();

      return normalizedTitle.contains(normalizedQuery) ||
          normalizedDesc.contains(normalizedQuery) ||
          normalizedDate.contains(normalizedQuery);
    }).toList();
  }

  // Method untuk clear search
  void clearSearch() {
    searchQuery.value = '';
    isSearching.value = false;
    filteredLaporan.value = allLaporan;
  }

  // Method untuk mendapatkan status hasil pencarian
  String get searchStatus {
    if (!isSearching.value) return '';
    if (filteredLaporan.isEmpty) return 'Tidak ada hasil pencarian';
    return 'Ditemukan ${filteredLaporan.length} hasil';
  }
}
