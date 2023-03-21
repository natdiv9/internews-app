import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import '../../../../../widgets/electoral_card/electoral_item_card_view.dart';
import 'controllers/electoral.controller.dart';

class DesktopElectoralScreen extends StatelessWidget {
  ElectoralController controller = Get.put(ElectoralController());
  DesktopElectoralScreen({Key? key}) : super(key: key);

  // final EducationController controller = Get.put(EducationController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Obx(
          () => ListView(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                'La loi électorale en RDC',
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
            Row(
              children: [
                Flexible(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColorTheme.primaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          iconSize: 36,
                          elevation: 1,
                          focusColor: Colors.transparent,
                          icon: const Icon(Icons.arrow_drop_down),
                          hint: const Text('Cas d\'éligibilités',
                              style: TextStyle(
                                  color: AppColorTheme.textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                          items: [
                            if (controller.electoralCategory.data != null)
                              for (var cat
                                  in controller.electoralCategory.data!)
                                DropdownMenuItem<String>(
                                    value: cat.id.toString(),
                                    child: Text(cat.designation,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)))
                          ],
                          onChanged: (value) => {
                            controller.getByCategory(value.toString()),
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            (!controller.isBusy)
                ? controller.electoralData.isEmpty
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
                        itemCount: controller.electoralData.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ElectoralItemCardView(
                                electoralData: controller.electoralData[index],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
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