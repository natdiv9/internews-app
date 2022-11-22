import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/themes/color_theme.dart';

class BecomeWriterWidget extends StatelessWidget {
  const BecomeWriterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 153,
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
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/feather.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      'Devenir Redacteur',
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              color: AppColorTheme.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: AppColorTheme.textColor.withOpacity(0.6),
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Plus',
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              color: AppColorTheme.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
