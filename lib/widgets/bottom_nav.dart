import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';
import '../controllers/navigation_controller.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();

    return Obx(
      () => Container(
        height: 90,
        margin: const EdgeInsets.only(bottom: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: CrystalNavigationBar(
          currentIndex: controller.selectedIndex.value,
          height: 77,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          onTap: controller.changeIndex,
          items: [
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: const Color(0xFF2563EB),
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.paper,
              unselectedIcon: IconlyLight.paper,
              selectedColor: const Color(0xFF2563EB),
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.category,
              unselectedIcon: IconlyLight.category,
              selectedColor: const Color(0xFF2563EB),
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.profile,
              unselectedIcon: IconlyLight.profile,
              selectedColor: const Color(0xFF2563EB),
            ),
          ],
        ),
      ),
    );
  }
}
