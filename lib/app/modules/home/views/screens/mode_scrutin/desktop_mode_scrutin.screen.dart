import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../widgets/no_data_widget.dart';
import '../../../../../widgets/scrutin_mode_card/scrutin_mode_card_view.dart';
import 'controllers/mode_scrutin.controller.dart';

class DesktopModeScrutinScreen extends StatelessWidget {
  DesktopModeScrutinScreen({Key? key}) : super(key: key);

  final ModeScrutinController controller = Get.put(ModeScrutinController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Obx(
          () => ListView(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                'Scrutin',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        color: AppColorTheme.textColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600)),
              ),
            ),

            const SizedBox(
              height: 16,
            ),
            (!controller.isBusy)
                ? controller.modeScrutinList.isEmpty
                    ? const NoDataWidget()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.modeScrutinList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ModeScrutinCardView(
                                modeScrutinsData:
                                    controller.modeScrutinList[index],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          );
                        })
                : const NewsCardShimmerWidget(),
            // const SizedBox(
            //   height: 24,
            // ),
          ]),
        ));
  }
}
