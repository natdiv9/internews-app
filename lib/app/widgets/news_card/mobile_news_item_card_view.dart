import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/data/models/news_model.dart';

class MobileNewsItemCardView extends GetView {
  const MobileNewsItemCardView({Key? key, required this.newsData})
      : super(key: key);
  final NewsData newsData;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Get.offNamed('/news/?id=${newsData.id}');
        },
        child: Container(
          height: 250,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: AppColorTheme.darkColor.withOpacity(0.04),
                blurRadius: 20,
                offset: const Offset(0, 2),
              ),
            ],
            color: AppColorTheme.whiteColor,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: Image.asset(
              'assets/images/ceni.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            )),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                newsData.titre!,
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        color: AppColorTheme.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                newsData.contenu?.substring(0, 90) ?? '',
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: AppColorTheme.textColor.withOpacity(0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w300)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Source: CENI",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: AppColorTheme.textColor,
                            fontSize: 9,
                            fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Il y a 2 heures",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: AppColorTheme.textColor,
                            fontSize: 9,
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
