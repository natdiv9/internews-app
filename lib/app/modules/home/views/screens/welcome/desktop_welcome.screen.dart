import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/modules/home/home_widgets/views/recent_news_views/desktop_recent_news_view.dart';
import 'package:mediaapp/app/modules/home/home_widgets/views/main_banner_view.dart';
import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import 'controllers/welcome.controller.dart';

class DesktopWelcomeScreen extends GetView<WelcomeController> {
  DesktopWelcomeScreen({Key? key}) : super(key: key);
  final WelcomeController controller = Get.put(WelcomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: ListView(children: [
            MainBannerView(),
            const SizedBox(
              height: 32,
            ),
            // KeyWordsView(),
            // const SizedBox(
            //   height: 24,
            // ),
            // IntroduceTextView(),
            Text(
              "Les dernières nouvelles",
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: AppColorTheme.textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),

            const SizedBox(
              height: 24,
            ),

            controller.newsList.isNotEmpty
                ? DesktopRecentNewsView(
                    newsList: controller.newsList.sublist(0, 3),
                  )
                : const NewsCardShimmerWidget(),
            const SizedBox(
              height: 24,
            ),

            queDitLaLoi(context),
          ]),
        ));
  }

  Widget queDitLaLoi(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColorTheme.darkColor.withOpacity(0.04),
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ]),
      child: InkWell(
        onTap: () {
          Get.offNamed("/electoral");
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/images/voteb.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Que dit la loi sur le vote dans notre pays ?',
                  // textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: AppColorTheme.rouge,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
