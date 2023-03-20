import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/modules/home/views/screens/electoral/controllers/electoral.controller.dart';

import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import '../../../../../widgets/electoral_card/electoral_item_card_view.dart';

class MobileElectoralScreen extends StatelessWidget {
  MobileElectoralScreen({Key? key}) : super(key: key);

  final ElectoralController controller = Get.put(ElectoralController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Obx(
          () => ListView(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/vote.jpg'),
                      fit: BoxFit.cover)),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(64),
                    child: SelectableText(
                      'La loi électorale en RDC',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              color: AppColorTheme.whiteColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            (controller.electoralData.isNotEmpty)
                ? ListView.builder(
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
