import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

class KeyWordsView extends GetView {
  const KeyWordsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Material(
            child: InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color.fromARGB(255, 248, 87, 47).withOpacity(0.2),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Fake news",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 248, 87, 47),
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColorTheme.primaryColor.withOpacity(0.2),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Enrolement",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: AppColorTheme.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ),
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColorTheme.primaryColor.withOpacity(0.2),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Enrolement",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: AppColorTheme.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ),
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColorTheme.primaryColor.withOpacity(0.2),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Enrolement",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: AppColorTheme.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
