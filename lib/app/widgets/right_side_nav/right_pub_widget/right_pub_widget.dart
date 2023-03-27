import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/themes/color_theme.dart';
import '../../no_data_widget.dart';
import 'controller/right_pub_widget.controller.dart';

class RightPubWidget extends StatelessWidget {
  RightPubWidget({super.key});

  RightPubController controller = Get.put(RightPubController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (!controller.isBusy)
          ? controller.candidatModel.data!.isEmpty
              ? const NoDataWidget()
              : Container(
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
                              'Législative ${DateTime.now().year}',
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
                                color: AppColorTheme.primaryColor
                                    .withOpacity(0.2)),
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
                      CarouselSlider.builder(
                        itemCount: controller.candidatModel.data!.length,
                        options: CarouselOptions(
                            // height: MediaQuery.of(context).size.height * 0.40,
                            aspectRatio: 1,
                            viewportFraction: 1,
                            autoPlay: true,
                            autoPlayCurve: Curves.decelerate,
                            enlargeCenterPage: true),
                        itemBuilder: (context, index, realIndex) {
                          return Column(
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/nangaa.jpg'),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                controller.candidatModel.data![index].nom!,
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: AppColorTheme.textColor
                                            .withOpacity(0.8),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Parti ${controller.candidatModel.data![index].partiPolitique}',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: AppColorTheme.textColor
                                            .withOpacity(0.6),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Column(
                                children: [
                                  for (var leg in controller.candidatModel
                                      .data![index].candidatLegislative!)
                                    Text('> ${leg.legislative!.designation!}',
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: AppColorTheme.textColor
                                                    .withOpacity(0.6),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500))),
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    ]),
                  ),
                )
          : buildShimmer();
    });
  }

  buildShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColorTheme.primaryColor.withOpacity(0.05),
      highlightColor: Colors.white12,
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 5000),
      child: Container(
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
            Container(
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white54),
            ),
          ]),
        ),
      ),
    );
  }
}
