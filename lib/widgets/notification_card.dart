import 'package:flutter/material.dart';
import 'package:talentaku/controllers/notification_controller.dart';
import 'package:talentaku/models/notification_event.dart';

class NotificationCard extends StatelessWidget {
  final NotificationEvent notification;
  final NotificationController controller;

  const NotificationCard({
    Key? key,
    required this.notification,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration:
          controller.getNotificationCardDecoration(notification.isUnread),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: controller
                  .getNotificationIconColor(notification.category)
                  .withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              controller.getNotificationIcon(
                  notification.category, notification.title),
              size: 24,
              color: controller.getNotificationIconColor(notification.category),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(
                    color: controller.textColor,
                    fontSize: 15,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Tanggal: ${notification.date}',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 10,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          if (notification.isUnread)
            Container(
              width: 7,
              height: 7,
              decoration: const BoxDecoration(
                color: Color(0xFFFF0000),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
