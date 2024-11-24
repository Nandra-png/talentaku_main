import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:talentaku/models/laporan_preview_event.dart';
import 'package:talentaku/constants/app_colors.dart';
import 'package:talentaku/constants/app_text_styles.dart';
import 'package:talentaku/constants/app_sizes.dart';

class LaporanSiswaController extends GetxController {
  final RxString selectedFilter = 'Semua Laporan'.obs;
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final RxList<LaporanPreviewEvent> filteredLaporan = <LaporanPreviewEvent>[].obs;
  
  final List<String> filterOptions = [
    'Semua Laporan',
    '7 Hari Terakhir',
    'Pilih Tanggal',
  ];

  // Dummy data laporan
  final List<LaporanPreviewEvent> allLaporan = [
    LaporanPreviewEvent(
      title: 'Laporan Harian - Rabu',
      date: '14 Maret 2024',
      description: 'Perkembangan motorik halus semakin membaik. Siswa dapat mengikuti instruksi dengan baik dan menyelesaikan kegiatan tepat waktu.',
    ),
    LaporanPreviewEvent(
      title: 'Laporan Harian - Selasa',
      date: '13 Maret 2024',
      description: 'Siswa mengikuti kegiatan belajar dengan antusias. Mampu berinteraksi dengan teman-teman dan menunjukkan sikap yang positif.',
    ),
    LaporanPreviewEvent(
      title: 'Laporan Harian - Senin',
      date: '12 Maret 2024',
      description: 'Hari ini siswa menunjukkan kemajuan yang baik dalam pembelajaran. Aktif berpartisipasi dalam kegiatan kelas dan mampu menyelesaikan tugas dengan baik.',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    filteredLaporan.value = _sortLaporanByDate(allLaporan);
  }

  // Method untuk mengurutkan laporan berdasarkan tanggal terbaru
  List<LaporanPreviewEvent> _sortLaporanByDate(List<LaporanPreviewEvent> laporan) {
    final DateFormat format = DateFormat('dd MMMM yyyy', 'id_ID');
    return List.from(laporan)..sort((a, b) {
      final DateTime dateA = format.parse(a.date);
      final DateTime dateB = format.parse(b.date);
      return dateB.compareTo(dateA);
    });
  }

  // Method untuk filter laporan
  void filterLaporan(String value) {
    selectedFilter.value = value;
    final DateFormat format = DateFormat('dd MMMM yyyy', 'id_ID');

    switch (value) {
      case '7 Hari Terakhir':
        final DateTime now = DateTime.now();
        final DateTime sevenDaysAgo = now.subtract(const Duration(days: 7));
        
        filteredLaporan.value = _sortLaporanByDate(
          allLaporan.where((laporan) {
            final DateTime laporanDate = format.parse(laporan.date);
            return laporanDate.isAfter(sevenDaysAgo);
          }).toList(),
        );
        break;

      case 'Pilih Tanggal':
        showDatePicker();
        break;

      default:
        filteredLaporan.value = _sortLaporanByDate(allLaporan);
    }
  }

  // Method untuk menampilkan date picker
  void showDatePicker() async {
    final DateTime? picked = await Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
        ),
        child: Container(
          padding: EdgeInsets.all(AppSizes.paddingXL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pilih Tanggal',
                style: AppTextStyles.heading3,
              ),
              SizedBox(height: AppSizes.spaceL),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(AppSizes.radiusL),
                ),
                child: Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: ColorScheme.light(
                      primary: AppColors.primary,
                      onPrimary: AppColors.textLight,
                      surface: AppColors.cardBackground,
                      onSurface: AppColors.textPrimary,
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primary,
                      ),
                    ),
                  ),
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2024),
                    lastDate: DateTime.now(),
                    onDateChanged: (DateTime date) {
                      selectedDate.value = date;
                      Get.back(result: date);
                    },
                  ),
                ),
              ),
              SizedBox(height: AppSizes.spaceL),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'Batal',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(width: AppSizes.paddingM),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedDate.value != null) {
                        Get.back(result: selectedDate.value);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      ),
                    ),
                    child: Text(
                      'Pilih',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    if (picked != null) {
      final DateFormat format = DateFormat('dd MMMM yyyy', 'id_ID');
      final String selectedDateStr = format.format(picked);
      
      filteredLaporan.value = _sortLaporanByDate(
        allLaporan.where((laporan) => laporan.date == selectedDateStr).toList(),
      );
    }
  }

  // Method untuk mendapatkan status filter
  String get filterStatus {
    if (selectedDate.value != null) {
      final DateFormat format = DateFormat('dd MMMM yyyy', 'id_ID');
      return 'Laporan tanggal ${format.format(selectedDate.value!)}';
    }
    return selectedFilter.value == '7 Hari Terakhir'
        ? '7 hari terakhir'
        : 'Semua laporan';
  }
}
