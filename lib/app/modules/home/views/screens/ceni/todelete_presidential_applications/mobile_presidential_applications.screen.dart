import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/candidats_card/mobile_candidat_card.dart';
import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import 'controllers/presidential_applications.controller.dart';

class MobilePresidentialApplicationsScreen extends StatelessWidget {
  MobilePresidentialApplicationsScreen({Key? key}) : super(key: key);

  final PresidentialApplicationsController controller =
      Get.put(PresidentialApplicationsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView(

          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Candidats à la presidence de 2023",
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: AppColorTheme.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 24,
            ),
            Obx(() {
              return (controller.candidatsList.length > 0)
                  ? ListView.builder(
                      itemCount: controller.candidatsList.length,
                      // scrollDirection: Axis.vertical,
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return MobileCandidatCardView(
                            controller.candidatsList[index],
                            controller.subpage);
                      })
                  : NewsCardShimmerWidget();
            }),
            const SizedBox(
              height: 24,
            ),
          ]),
    );
  }
}
