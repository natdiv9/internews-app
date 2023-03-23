import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

class LegislativesDesktopScreen extends StatelessWidget {
  const LegislativesDesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView(children: [
        Text(
          "Législatives",
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  color: AppColorTheme.textColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold)),
        ),
      ]),
    );
  }
}
