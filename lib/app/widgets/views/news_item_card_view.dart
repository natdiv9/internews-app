import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

class NewsItemCardView extends GetView {
  const NewsItemCardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 164,
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: AppColorTheme.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliquaLorem ipsum dolor sit amet, consectetur',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: AppColorTheme.textColor
                                        .withOpacity(0.6),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Source: CENI",
                              style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      color: AppColorTheme.textColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            ),
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
                                    foregroundColor:
                                        AppColorTheme.secondayColor),
                                child: Row(
                                  children: [
                                    Icon(Icons.ios_share),
                                    Text(
                                      "Partager",
                                      style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                )),
                            TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor: AppColorTheme.whiteColor,
                                    foregroundColor:
                                        AppColorTheme.secondayColor),
                                child: Row(
                                  children: [
                                    Icon(Icons.expand_circle_down_outlined),
                                    Text(
                                      "Lire la suite",
                                      style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Container(
                    height: 130,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                            image: AssetImage('assets/images/ceni.jpg'),
                            fit: BoxFit.cover)),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
