import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

import 'controllers/calendar.controller.dart';

class DesktopCalendarScreen extends GetView<CalendarController> {
  const DesktopCalendarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView(children: [
        Text(
          "Calendrier électoral de la CENI",
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  color: AppColorTheme.textColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          height: 250,
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
          child: Image.asset(
            'assets/images/calendar.png',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        _buildCalendarItemWidget(),
        SizedBox(
          height: 16,
        ),
        _buildCalendarItemWidget(),
        SizedBox(
          height: 16,
        ),
        _buildCalendarItemWidget(),
        SizedBox(
          height: 16,
        ),
        _buildCalendarItemWidget(),
        SizedBox(
          height: 16,
        ),
        _buildCalendarItemWidget(),
        SizedBox(
          height: 16,
        ),
        _buildCalendarItemWidget(),
        SizedBox(
          height: 16,
        ),
        _buildCalendarItemWidget(),
        SizedBox(
          height: 16,
        ),
      ]),
    );
  }

  Container _buildCalendarItemWidget() {
    return Container(
      height: 100,
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
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "25",
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
                    "Novembre",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: AppColorTheme.textColor.withOpacity(0.8),
                            fontSize: 24,
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
                    "Début des enrôlements",
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
                      "Lorem ipsum dolor sit amet, consectetur ipsum dolor sit amet, consectetur ipsum dolor sit amet, consectetur",
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
            SizedBox(
              width: 8,
            ),
            Container(
              height: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: AppColorTheme.primaryColor,
                  width: 0.20,
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Center(
                  child: Text(
                    "Savoir Plus",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: AppColorTheme.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
