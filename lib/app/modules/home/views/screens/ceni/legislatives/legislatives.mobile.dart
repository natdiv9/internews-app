import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

class MobileLegislativeScreen extends StatelessWidget {
  const MobileLegislativeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView(children: [
        Text(
          "Candidats à la presidence de 2023",
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  color: AppColorTheme.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          height: 24,
        ),
        const SizedBox(
          height: 24,
        ),
      ]),
    );
  }
}
