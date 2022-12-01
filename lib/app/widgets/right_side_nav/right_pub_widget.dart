import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/themes/color_theme.dart';

class RightPubWidget extends StatelessWidget {
  const RightPubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Canditature 2022',
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: AppColorTheme.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColorTheme.primaryColor.withOpacity(0.2)),
                child: const Center(
                    child: Icon(
                  Icons.chevron_left,
                  color: AppColorTheme.whiteColor,
                )),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColorTheme.primaryColor),
                child: const Center(
                    child: Icon(
                  Icons.chevron_right,
                  color: AppColorTheme.whiteColor,
                )),
              )
            ],
          ),
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
          Container(
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    image: AssetImage('assets/images/nangaa.jpg'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: AppColorTheme.textColor.withOpacity(0.6),
                    fontSize: 12,
                    fontWeight: FontWeight.w400)),
          ),
        ]),
      ),
    );
  }
}
