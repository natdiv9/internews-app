import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/data/models/news_model.dart';

class MobileEducationContentsView extends GetView {
  MobileEducationContentsView({Key? key, required this.newsEducation})
      : super(key: key);
  List<NewsData> newsEducation;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: newsEducation.length,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              height: 312,
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
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/machine.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: Text(
                        (newsEducation[index].contenu!.length > 120)
                            ? '${newsEducation[index].contenu!.substring(0, 120)}...'
                            : newsEducation[index].contenu!,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: AppColorTheme.textColor.withOpacity(0.6),
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Il y a 2 heures",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: AppColorTheme.textColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ),
                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: AppColorTheme.whiteColor,
                                foregroundColor: AppColorTheme.secondayColor),
                            child: Row(
                              children: [
                                const Icon(Icons.ios_share),
                                Text(
                                  "Partager",
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
