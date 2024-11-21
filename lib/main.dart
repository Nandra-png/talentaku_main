import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/navigation_controller.dart';
import 'views/home/home_screen.dart';
import 'views/laporan_siswa/laporan_siswa_screen.dart';
import 'views/kelas/kelas_screen.dart';
import 'views/profile/profile_screen.dart';
import 'widgets/bottom_nav.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const MainScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(NavigationController());
      }),
    );
  }
}

class MainScreen extends GetView<NavigationController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: const [
            HomeScreen(),
            LaporanSiswaScreen(),
            KelasScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
