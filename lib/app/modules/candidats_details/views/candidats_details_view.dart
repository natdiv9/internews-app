import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/views/news_card_shimmer.dart';

import '../controllers/candidats_details_controller.dart';

class CandidatsDetailsView extends StatelessWidget {
  CandidatsDetailsView({Key? key}) : super(key: key);

  CandidatsDetailsController controller = Get.put(CandidatsDetailsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        return (!controller.isLoading)
            ? ListView(
                children: [
                  Container(
                      height: Get.height * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/vote.jpg'),
                              fit: BoxFit.cover)),
                      child: Stack(clipBehavior: Clip.none, children: const [
                        Positioned(
                            left: 32,
                            bottom: -90,
                            child: CircleAvatar(
                              backgroundColor: AppColorTheme.whiteColor,
                              radius: 88,
                              child: CircleAvatar(
                                radius: 80,
                                backgroundColor: AppColorTheme.whiteColor,
                                backgroundImage:
                                    AssetImage('assets/images/candidat1.jpg'),
                              ),
                            ))
                      ])),
                  const SizedBox(
                    height: 106,
                  ),
                  Text(
                    "Martin Fayulu",
                    // "${controller.candidatData.user.firstName} ${controller.candidatData.user.lastName}",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: AppColorTheme.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    "Candidat No ${controller.candidatData.id}",
                    // "${controller.candidatData.user.firstName} ${controller.candidatData.user.lastName}",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: AppColorTheme.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    "Parti LAMUKA",
                    // "${controller.candidatData.user.firstName} ${controller.candidatData.user.lastName}",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: AppColorTheme.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              )
            : NewsCardShimmerWidget();
      }),
    );
  }
}
