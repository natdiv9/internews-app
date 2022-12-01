import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../core/themes/color_theme.dart';

class MeteoWidget extends StatelessWidget {
  const MeteoWidget({super.key});

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
            Row(children: [
              Expanded(
                child: Text(
                  'Lubumbashi, RDC',
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: AppColorTheme.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
              ),
              SvgPicture.asset(
                'assets/icons/crosshair.svg',
                width: 18,
                height: 18,
                fit: BoxFit.contain,
              )
            ]),
            const SizedBox(
              height: 8,
            ),
            Divider(
              height: 0.2,
              color: AppColorTheme.textColor.withOpacity(0.2),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ensoleillé',
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              color: AppColorTheme.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      '31 °C',
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              color: AppColorTheme.textColor,
                              fontSize: 26,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          'Celsius',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: AppColorTheme.textColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        Text(
                          'Fahrenheit',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color:
                                      AppColorTheme.textColor.withOpacity(0.3),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: SvgPicture.asset(
                    'assets/icons/sun.svg',
                    width: 52,
                    height: 52,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
