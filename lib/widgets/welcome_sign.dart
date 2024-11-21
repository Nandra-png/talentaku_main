import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../views/notification/notification_screen.dart';

class WelcomeSign extends StatelessWidget {
  const WelcomeSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 75, top: 20),
            child: SizedBox(
              width: 193,
              child: Text(
                'Selamat Datang,',
                style: TextStyle(
                  color: Color(0xFF353535),
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 75, top: 31),
            child: Text(
              controller.userName,
              style: TextStyle(
                color: Color(0xFF353535),
                fontSize: 24,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/logo.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 320, top: 19),
            child: GestureDetector(
              onTap: () => Get.to(() => const NotificationScreen()),
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.notifications),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
