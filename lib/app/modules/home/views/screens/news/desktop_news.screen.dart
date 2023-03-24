import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/news_card_shimmer.dart';
import 'package:mediaapp/app/widgets/news_card/desktop_news_item_card_view.dart';

import '../../../../../widgets/news_card/news_card.dart';
import '../../../../../widgets/no_data_widget.dart';
import 'controllers/news.controller.dart';

class DesktopNewsScreen extends StatelessWidget {
  DesktopNewsScreen({Key? key}) : super(key: key);
  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Obx(
          () => (!controller.isBusy)
              ? controller.newsList.isEmpty
                  ? const NoDataWidget()
                  : ListView(children: [
                      buildCarousel(context),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Les dernières nouvelles",
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                color: AppColorTheme.textColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.newsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 36),
                              child: NewsCardWidget(
                                  index: index,
                                  news: controller.newsList[index]),
                            );
                          }),
                    ])
              : const NewsCardShimmerWidget(),
        ));
  }

  CarouselSlider buildCarousel(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: controller.getFiveNews().length,
      options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.40,
          aspectRatio: 1,
          viewportFraction: 1,
          autoPlay: true,
          autoPlayCurve: Curves.easeInOutExpo,
          enlargeCenterPage: true),
      itemBuilder: (context, index, realIndex) {
        return Container(
            clipBehavior: Clip.hardEdge,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/ceni.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.8)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        //"L’élection présidentielle est fixée au 20 décembre 2023, selon le calendrier dévoilé officiellement ce samedi 26 novembre par Denis Kadima, président de la Commission électorale nationale indépendante...",
                        controller.getFiveNews()[index].titre!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.publicSans(
                            textStyle: const TextStyle(
                                color: AppColorTheme.whiteColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
