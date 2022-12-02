import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/data/models/candidats_model.dart';

class MobileCandidatCardView extends GetView {
  const MobileCandidatCardView(this.candidatData, this.subpage, {Key? key})
      : super(key: key);
  final CandidatsData candidatData;
  final String subpage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Material(
        child: InkWell(
          onTap: () {
            Get.offNamed(
                '/ceni?subpage=${subpage}&id=${controller.candidatData.id}');
          },
          child: Container(
            // height: 362,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 170,
                  // width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/candidat1.jpg'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  '${candidatData.id}',
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: AppColorTheme.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "${candidatData.user!.firstName} ${candidatData.user!.lastName}",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: AppColorTheme.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "${candidatData.province}",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: AppColorTheme.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
