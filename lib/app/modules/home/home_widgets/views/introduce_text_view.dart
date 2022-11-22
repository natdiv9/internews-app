import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

class IntroduceTextView extends GetView {
  const IntroduceTextView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      textAlign: TextAlign.justify,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: AppColorTheme.textColor.withOpacity(0.6),
              fontSize: 16,
              fontWeight: FontWeight.w400)),
    );
  }
}
