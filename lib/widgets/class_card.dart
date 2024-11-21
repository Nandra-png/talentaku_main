import 'package:flutter/material.dart';
import 'package:talentaku/models/class_event.dart';

class ClassCard extends StatelessWidget {
  final ClassEvent classEvent;

  const ClassCard({
    Key? key,
    required this.classEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 126,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 126,
            decoration: BoxDecoration(
              color: Color(0xFFD5DDFF),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 10,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
          // Nama Kelompok
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  classEvent.groupName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_today_sharp,
                        size: 12, color: Color(0xFF43508C)),
                    SizedBox(width: 2),
                    Text(
                      classEvent.ageRange,
                      style: TextStyle(
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
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 72),
            child: Row(
              children: List.generate(4, (index) {
                return Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Icon(Icons.person, size: 20, color: Colors.white),
                  margin: EdgeInsets.only(left: 2),
                );
              }),
            ),
          ),
          Positioned(
            right: 18,
            top: 15,
            child: Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage(classEvent.image), // Ganti dengan path gambar
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
