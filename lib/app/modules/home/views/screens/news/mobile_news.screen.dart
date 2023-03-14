import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/news_card/mobile_news_item_card_view.dart';
import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import 'controllers/news.controller.dart';

class MobileNewsScreen extends StatelessWidget {
  MobileNewsScreen({Key? key}) : super(key: key);
  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Obx(
          () => ListView(

              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                (controller.newsList.length > 0)
                    ? Column(
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
                          SelectableText(
                            "L’élection présidentielle est fixée au 20 décembre 2023, selon le calendrier dévoilé officiellement ce samedi 26 novembre par Denis Kadima, président de la Commission électorale nationale indépendante ...",
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    color: AppColorTheme.textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                          // SelectableText(
                          //   (controller.newsList[0].contenu.length > 180)
                          //       ? '${controller.newsList[0].contenu.substring(0, 180)}...'
                          //       : controller.newsList[0].contenu,
                          //   textAlign: TextAlign.justify,
                          //   style: GoogleFonts.roboto(
                          //       textStyle: TextStyle(
                          //           color: AppColorTheme.textColor
                          //               .withOpacity(0.6),
                          //           fontSize: 16,
                          //           fontWeight: FontWeight.w400)),
                          // ),
                        ],
                      )
                    : NewsCardShimmerWidget(),

                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    _lireLaSuiteButton(),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                SelectableText(
                  'Plus d\infos',
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: AppColorTheme.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
                const SizedBox(
                  height: 24,
                ),
                // _buildRecentNewsWidget(),

                (controller.newsList.length > 0)
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.newsList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              MobileNewsItemCardView(
                                newsData: controller.newsList[index],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          );
                        })
                    : NewsCardShimmerWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(150, 38)),
                          overlayColor: MaterialStateProperty.all(
                              AppColorTheme.secondayColor.withOpacity(0.7)),
                          backgroundColor: MaterialStateProperty.all(
                              AppColorTheme.primaryColor)),
                      child: SelectableText(
                        'Voir plus',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                color: AppColorTheme.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
              ]),
        ));
  }

  OutlinedButton _lireLaSuiteButton() {
    return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(fixedSize: Size(300, 38)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Text(
                'Lire la suite de cet article',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        color: AppColorTheme.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/arrow-right.svg',
              width: 18,
              height: 18,
              fit: BoxFit.contain,
            )
          ],
        ));
  }
}
