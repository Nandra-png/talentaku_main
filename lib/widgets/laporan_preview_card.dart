import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku/models/laporan_preview_event.dart';

class LaporanPreviewCard extends StatelessWidget {
  final LaporanPreviewEvent laporan;

  const LaporanPreviewCard({
    Key? key,
    required this.laporan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.snackbar(
          'Sukses',
          'Laporan berhasil dibuka',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
        );
      },
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFE6EAFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6E85E8).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.description_outlined,
                      color: Color(0xFF6E85E8),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          laporan.title,
                          style: const TextStyle(
                            color: Color(0xFF353535),
                            fontSize: 16,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_sharp,
                              color: Color(0xFF43508C),
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              laporan.date,
                              style: const TextStyle(
                                color: Color(0xFF43508C),
                                fontSize: 12,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                laporan.description,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 12,
                  fontFamily: 'Manrope',
                  height: 1.5,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
