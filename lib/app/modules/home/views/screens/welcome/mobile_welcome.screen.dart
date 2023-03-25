import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/modules/home/home_widgets/views/education_content_view/mobile_education_contents_view.dart';
import 'package:mediaapp/app/modules/home/home_widgets/views/key_words_view.dart';
import 'package:mediaapp/app/modules/home/home_widgets/views/main_banner_view.dart';
import 'package:mediaapp/app/modules/home/home_widgets/views/recent_news_views/mobile_recent_news_view.dart';
import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import 'controllers/welcome.controller.dart';

class MobileWelcomeScreen extends GetView<WelcomeController> {
  MobileWelcomeScreen({Key? key}) : super(key: key);
  final WelcomeController controller = Get.put(WelcomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainBannerView(),
            const SizedBox(
              height: 24,
            ),
            KeyWordsView(),
            const SizedBox(
              height: 24,
            ),
            // IntroduceTextView(),
            Text(
              'Informations recentes',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: AppColorTheme.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
            ),
            const SizedBox(
              height: 24,
            ),

            Obx(() => controller.newsList.length > 0
                ? MobileRecentNewsView(
                    newsList: controller.newsList.sublist(0, 4),
                  )
                : NewsCardShimmerWidget()),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Eduquez-vous sur le processus électoral en RDC',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: AppColorTheme.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
            ),
          ]),
    );
  }
}
