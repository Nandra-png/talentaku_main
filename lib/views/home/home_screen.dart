import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku/controllers/home_controller.dart';
import 'package:talentaku/models/program_tambahan_event.dart';
import 'package:talentaku/widgets/program_tambahan_card.dart';

import 'package:talentaku/widgets/welcome_sign.dart';
import 'package:talentaku/widgets/broadcast_card.dart';
import 'package:talentaku/widgets/categories_line.dart';
import 'package:talentaku/widgets/class_card.dart';
import 'package:talentaku/widgets/laporan_preview_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //header
                const SizedBox(height: 20),
                const WelcomeSign(),
                const SizedBox(height: 5),

                //pengumuman
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: PageController(viewportFraction: 0.98),
                    itemCount: controller.events.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: BroadcastCard(
                          event: controller.events[index],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),

                CategoriesLine(
                  categoryEvent: controller.categories[0],
                ),
                //class card

                ClassCard(
                  classEvent: controller.classEvents[0],
                ),

                const SizedBox(height: 30),

                CategoriesLine(
                  categoryEvent: controller.categories[1],
                ),

                // program card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.programDetails.length,
                      itemBuilder: (context, index) {
                        final program = controller.programDetails[index];
                        return ProgramCard(
                          programEvent: ProgramEvent(
                            title: program['title']!,
                            image: program['image']!,
                            description: program['description']!,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CategoriesLine(
                  categoryEvent: controller.categories[2],
                ),

                // Preview Laporan Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.laporanPreviews.length,
                      itemBuilder: (context, index) {
                        return LaporanPreviewCard(
                          laporan: controller.laporanPreviews[index],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
