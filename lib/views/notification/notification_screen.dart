import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku/controllers/notification_controller.dart';
import 'package:talentaku/widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());

    return Scaffold(
      backgroundColor: controller.backgroundColor,
      body: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: controller.headerColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: controller.goBack,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: controller.headerColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'images/logo.png',
                                width: 26,
                                height: 26,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Pengumuman',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() => Row(
                    children: List.generate(
                      controller.categories.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                            right: index < controller.categories.length - 1
                                ? 10
                                : 0),
                        child: _buildCategoryTab(
                            controller.categories[index], index, controller),
                      ),
                    ),
                  )),
            ),
          ),

          // Notification list
          Expanded(
            child: Obx(() {
              final notifications = controller.getFilteredNotifications();
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return NotificationCard(
                    notification: notification,
                    controller: controller,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(
      String title, int index, NotificationController controller) {
    return GestureDetector(
      onTap: () => controller.changeCategory(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: controller.getCategoryTabDecoration(index),
        child: Text(
          title,
          style: TextStyle(
            color: controller.textColor,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
