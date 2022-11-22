import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/modules/home/home_widgets/views/education_contents_view.dart';
import 'package:mediaapp/app/modules/home/home_widgets/views/introduce_text_view.dart';
import 'package:mediaapp/app/modules/home/home_widgets/views/key_words_view.dart';
import 'package:mediaapp/app/modules/home/home_widgets/views/main_banner_view.dart';
import 'package:mediaapp/app/modules/home/home_widgets/views/recent_news_view.dart';

import 'controllers/welcome.controller.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
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
            IntroduceTextView(),
            const SizedBox(
              height: 24,
            ),
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
            RecentNewsView(),
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
            const SizedBox(
              height: 32,
            ),
            EducationContentsView(),
            const SizedBox(
              height: 24,
            ),
          ]),
    );
  }
}
