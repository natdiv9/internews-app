import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/views/news_card_shimmer.dart';
import '../controllers/news_details_controller.dart';

class NewsDetailsView extends StatelessWidget {
  NewsDetailsView({Key? key}) : super(key: key);

  final NewsDetailsController controller = Get.put(NewsDetailsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Obx(() {
        return (!controller.isLoading)
            ? ListView(

                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                      controller.newsData.titre!,
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              color: AppColorTheme.textColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          width: double.infinity,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/vote.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          controller.newsData.contenu!,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color:
                                      AppColorTheme.textColor.withOpacity(0.6),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ])
            : NewsCardShimmerWidget();
      }),
    );
  }
}
