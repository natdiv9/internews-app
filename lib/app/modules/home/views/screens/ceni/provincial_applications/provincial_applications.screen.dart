import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

import 'controllers/provincial_applications.controller.dart';

class ProvincialApplicationsScreen
    extends GetView<ProvincialApplicationsController> {
  const ProvincialApplicationsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView(

          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Députation provinciale 2023",
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: AppColorTheme.textColor,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height,
              child: AspectRatio(
                aspectRatio: 1,
                child: GridView.builder(
                    itemCount: 8,
                    // scrollDirection: Axis.vertical,
                    primary: false,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            // childAspectRatio: 2,
                            crossAxisSpacing: 32,
                            mainAxisSpacing: 32,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Material(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 462,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColorTheme.darkColor.withOpacity(0.04),
                                  blurRadius: 20,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                              color: AppColorTheme.whiteColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 342,
                                    // width: 125,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/candidat1.jpg'),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Candidat No 3",
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          color: AppColorTheme.textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Martin Fayulu",
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          color: AppColorTheme.textColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Parti LAMUKA",
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          color: AppColorTheme.textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ]),
    );
  }
}
