import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/modules/home/home_widgets/views/introduce_text_view.dart';
import 'package:mediaapp/app/widgets/views/news_item_card_view.dart';

import 'controllers/education.controller.dart';

class EducationScreen extends GetView<EducationController> {
  const EducationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.40,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: const DecorationImage(
                  image: AssetImage('assets/images/vote.jpg'),
                  fit: BoxFit.cover)),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.black.withOpacity(0.6),
              ),
              Padding(
                padding: const EdgeInsets.all(64),
                child: Text(
                  'Eduquez-vous sur le processus électoral en RDC',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: AppColorTheme.whiteColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        IntroduceTextView(),
        const SizedBox(
          height: 24,
        ),
        const SizedBox(
          height: 24,
        ),
        NewsItemCardView(),
        const SizedBox(
          height: 16,
        ),
        NewsItemCardView(),
        const SizedBox(
          height: 16,
        ),
        NewsItemCardView(),
        const SizedBox(
          height: 16,
        ),
        NewsItemCardView(),
        const SizedBox(
          height: 16,
        ),
        NewsItemCardView(),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(150, 38)),
                  overlayColor: MaterialStateProperty.all(
                      AppColorTheme.secondayColor.withOpacity(0.7)),
                  backgroundColor:
                      MaterialStateProperty.all(AppColorTheme.primaryColor)),
              child: Text(
                'Voir plus',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        color: AppColorTheme.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
      ]),
    );
  }
}
