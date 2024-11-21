import 'package:get/get.dart';
import 'package:talentaku/models/broadcast_event.dart';
import 'package:talentaku/models/categories_event.dart';
import 'package:talentaku/models/class_event.dart';
import 'package:talentaku/models/laporan_preview_event.dart';

class HomeController extends GetxController {
  String userName = 'Narendra';

  List<Event> events = [
    Event(name: 'Hari Kemerdekaan', date: '17 Agustus 2024'),
    Event(name: 'Upacara Hari Pahlawan', date: '10 November 2024'),
    Event(name: 'Hari guru', date: '25 November 2024'),
  ];

  List<CategoryEvent> categories = [
    CategoryEvent(
      title: 'Kelas Anda',
      image: 'images/boy1.png',
    ),
    CategoryEvent(
      title: 'Program Tambahan',
      image: 'images/boy2.png',
    ),
    CategoryEvent(
      title: 'Laporan Pembelajaran',
      image: 'images/boy1.png',
    ),
  ];

  List<ClassEvent> classEvents = [
    ClassEvent(
      groupName: 'Kelompok Pelangi',
      ageRange: '2 - 3 Tahun',
      image: 'images/abc.png',
    ),
  ];

  // Data untuk program tambahan
  List<Map<String, String>> programDetails = [
    {
      'title': 'Terapi Wicara',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'image': 'images/terapiwicara.png',
    },
    {
      'title': 'Kelas Musik',
      'description': 'Belajar musik dengan cara yang menyenangkan.',
      'image': 'images/boy1.png',
    },
    {
      'title': 'Kelas Seni',
      'description': 'Mengekspresikan diri melalui seni.',
      'image': 'images/boy1.png',
    },
  ];

  // Tambahkan list untuk laporan preview
  final List<LaporanPreviewEvent> laporanPreviews = [
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

  void updateUserName(String newName) {
    userName = newName;
    update();
  }
}
