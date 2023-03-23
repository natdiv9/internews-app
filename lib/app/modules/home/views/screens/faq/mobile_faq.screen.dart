import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/themes/color_theme.dart';
import '../../../../../widgets/news_card_shimmer.dart';
import '../../../../../widgets/no_data_widget.dart';
import '../../../home_widgets/views/introduce_text_view.dart';
import 'controllers/faq.controller.dart';

class MobileFAQScreen extends StatelessWidget {
  MobileFAQScreen({Key? key}) : super(key: key);

  final FAQController controller = Get.put(FAQController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Obx(
          () => ListView(children: [
            const SizedBox(
              height: 16,
            ),
            (!controller.isBusy)
                ? (controller.faqList.isEmpty)
                    ? const NoDataWidget()
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
