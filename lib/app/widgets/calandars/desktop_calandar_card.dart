import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/helpers/date_functions.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/data/models/calandars_model.dart';

class DesktopCalandrCardView extends GetView {
  const DesktopCalandrCardView(this.calandarsData, this.subpage, {Key? key})
      : super(key: key);
  final CalandarsData calandarsData;
  final String subpage;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: AppColorTheme.darkColor.withOpacity(0.04),
                blurRadius: 10,
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
                    children: [
                      Text(
                        calandarsData.dateStart!.split('-')[2],
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: AppColorTheme.textColor.withOpacity(0.8),
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        getNameOfMonth(
                            DateTime.parse(calandarsData.dateStart!)),
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: AppColorTheme.textColor.withOpacity(0.8),
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        calandarsData.title!,
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                color: AppColorTheme.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: Text(
                          calandarsData.content!,
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: AppColorTheme.textColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   width: 8,
                // ),
                // Container(
                //   height: 38,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(4),
                //     border: Border.all(
                //       color: AppColorTheme.primaryColor,
                //       width: 0.20,
                //     ),
                //     color: Colors.white,
                //   ),
                //   child: Padding(
                //     padding:
                //         const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //     child: Center(
                //       child: Text(
                //         "Savoir Plus",
                //         style: GoogleFonts.roboto(
                //             textStyle: const TextStyle(
                //                 color: AppColorTheme.primaryColor,
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w400)),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}
