import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

class EducationContentsView extends GetView {
  const EducationContentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 1,
        child: GridView.builder(
            itemCount: 4,
            scrollDirection: Axis.vertical,
            primary: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 16, crossAxisSpacing: 16, crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
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
                    children: [
                      Container(
                        height: 198,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                                image: AssetImage('assets/images/machine.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color:
                                      AppColorTheme.textColor.withOpacity(0.6),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
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
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
