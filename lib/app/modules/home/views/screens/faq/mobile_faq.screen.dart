import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../widgets/news_card_shimmer.dart';
import '../../../home_widgets/views/introduce_text_view.dart';
import 'controllers/faq.controller.dart';

class MobileFAQScreen extends StatelessWidget {
  MobileFAQScreen({Key? key}) : super(key: key);

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
            (controller.faqList.isNotEmpty)
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.faqList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                            child: Column(children: [
                              Text(controller.faqList[index].question,
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          // color: AppColorTheme.whiteColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold))),
                              Text(controller.faqList[index].answer,
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          // color: AppColorTheme.whiteColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500))),
                            ]),
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
