import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

import '../../data/models/electoral_model.dart';

class ElectoralItemCardView extends GetView {
  const ElectoralItemCardView({Key? key, required this.electoralData})
      : super(key: key);
  final ElectoralData electoralData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              electoralData.titre,
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: AppColorTheme.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              electoralData.contenu,
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: AppColorTheme.textColor.withOpacity(0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ]),
      ),
    );
  }
}
