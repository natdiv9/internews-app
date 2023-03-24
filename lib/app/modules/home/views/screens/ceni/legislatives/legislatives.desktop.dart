import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

import '../../../../../../widgets/candidats_card/candidat_card.dart';
import '../../../../../../widgets/news_card_shimmer.dart';
import '../../../../../../widgets/no_data_widget.dart';
import 'controllers/legislatives..controller.dart';

class LegislativeDesktopScreen extends StatelessWidget {
  LegislativeDesktopScreen({Key? key}) : super(key: key);

  LegislativeController controller = Get.put(LegislativeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Obx(() {
        return (!controller.isBusy)
            ? controller.candidatData.isEmpty
                ? const NoDataWidget()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                          "Candidats",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: AppColorTheme.textColor,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        // Row(
                        //   children: [
                        //     if (controller.isVilleSelected)
                        //       _legislativeDropDown(),
                        //     const SizedBox(width: 8),
                        //     _provincesDropDown(),
                        //     const SizedBox(width: 8),
                        //     if (controller.isProvinceSelected)
                        //       _villesDropDown(),
                        //   ],
                        // ),
                        controller.isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(32.0),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              )
                            : Flexible(
                                child: GridView.custom(
                                  gridDelegate: SliverWovenGridDelegate.count(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    pattern: [
                                      const WovenGridTile(1),
                                      const WovenGridTile(
                                        1,
                                        crossAxisRatio: 0.9,
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                      ),
                                    ],
                                  ),
                                  childrenDelegate: SliverChildBuilderDelegate(
                                    childCount: controller.candidatData.length,
                                    (context, index) => CandidatCardWidget(
                                      candidat: controller.candidatData[index],
                                      subpage: controller.subpage,
                                    ),
                                  ),
                                ),
                              )
                      ])
            : const NewsCardShimmerWidget();
      }),
    );
  }
}
