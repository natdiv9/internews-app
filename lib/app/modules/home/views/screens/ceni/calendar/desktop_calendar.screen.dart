import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import '../../../../../../widgets/calandars/calandar_card.dart';
import 'controllers/calendar.controller.dart';

class DesktopCalendarScreen extends StatelessWidget {
  DesktopCalendarScreen({Key? key}) : super(key: key);

  final CalendarController controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        child: Obx(
          () => (!controller.isBusy)
              ? controller.calandarsList.isEmpty
                  ? ListView(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              SvgPicture.asset(
                                'assets/images/no_data.svg',
                                width: 200,
                                height: 200,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text('Aucune donnée disponible',
                                  style: TextStyle(
                                      color: AppColorTheme.textColor
                                          .withOpacity(0.60),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      ],
                    )
                  : ListView(children: [
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
                      const SizedBox(
                        height: 24,
                      ),
                      ListView.builder(
                          itemCount: controller.calandarsList.length,
                          // scrollDirection: Axis.vertical,
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CalandarCardWidget(
                                calandarsData: controller.calandarsList[index]);
                          })
                    ])
              : ListView(
                  children: const [
                    NewsCardShimmerWidget(),
                  ],
                ),
        ));
  }
}
