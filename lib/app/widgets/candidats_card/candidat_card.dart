import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/data/models/candidat_model.dart';

class CandidatCardWidget extends StatelessWidget {
  const CandidatCardWidget(
      {super.key, required this.candidat, required this.subpage});
  final CandidatData candidat;
  final String subpage;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          var url = '/ceni?subpage=$subpage&id=${candidat.id}';
          // print(url);
          Get.offNamed(url);
        },
        child: Stack(
          children: [
            Image.asset('assets/images/candidat1.jpg'),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColorTheme.darkColor.withOpacity(0.60),
                    // borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(candidat.nom!,
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: AppColorTheme.whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500))),
                      Text('Parti ${candidat.partiPolitique ?? ''}',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: AppColorTheme.whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400))),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
