import 'package:flutter/material.dart';
import 'package:talentaku/models/categories_event.dart';

class CategoriesLine extends StatelessWidget {
  final CategoryEvent categoryEvent;

  const CategoriesLine({
    Key? key,
    required this.categoryEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      height: 64,
      margin: const EdgeInsets.symmetric(horizontal: 20), 
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFF6E85E8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.centerLeft, 
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 110.0), 
                child: Text(
                  categoryEvent.title,
                  style: const TextStyle(
                    color: Color(0xFFFEFEFE),
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -32,
            left: 20,
            child: Container(
              width: 80,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(
                  categoryEvent.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
