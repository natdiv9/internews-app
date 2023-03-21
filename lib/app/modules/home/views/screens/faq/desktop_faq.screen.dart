import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import '../../../../../core/themes/color_theme.dart';
import 'controllers/faq.controller.dart';

class DesktopFAQScreen extends StatelessWidget {
  DesktopFAQScreen({Key? key}) : super(key: key);

  final FAQController controller = Get.put(FAQController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Obx(
          () => ListView(children: [
            const SizedBox(
              height: 16,
            ),
            (!controller.isBusy)
                ? (controller.faqList.isEmpty)
                    ? Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 32,
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
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.faqList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.faqList[index].titre,
                                        style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                                color: AppColorTheme.textColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500))),
                                    const SizedBox(height: 18),
                                    Text(controller.faqList[index].contenu,
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: AppColorTheme.textColor
                                                    .withOpacity(0.6),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400))),
                                  ]),
                            ),
                          );
                        })
                : const NewsCardShimmerWidget(),
            const SizedBox(
              height: 24,
            ),
          ]),
        ));
  }
}
