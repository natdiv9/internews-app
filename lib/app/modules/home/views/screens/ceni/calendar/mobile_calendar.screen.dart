import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/calandars/mobile_calendar_card.dart';
import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import 'controllers/calendar.controller.dart';

class MobileCalendarScreen extends GetView<CalendarController> {
  MobileCalendarScreen({Key? key}) : super(key: key);
  final CalendarController controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView(children: [
        Text(
          "Calendrier électoral de la CENI",
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  color: AppColorTheme.textColor,
                  fontSize: 20,
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
        Obx(() {
          return (controller.calandarsList.length > 0)
              ? ListView.builder(
                  itemCount: controller.calandarsList.length,
                  // scrollDirection: Axis.vertical,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return MobileCalandrCardView(
                        controller.calandarsList[index], controller.subpage);
                  })
              : NewsCardShimmerWidget();
        }),
        SizedBox(
          height: 16,
        ),
      ]),
    );
  }
}
