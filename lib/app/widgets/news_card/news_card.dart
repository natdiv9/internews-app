import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/helpers/date_functions.dart';
import '../../core/themes/color_theme.dart';
import '../../data/models/news_model.dart';

class NewsCardWidget extends StatelessWidget {
  NewsCardWidget({super.key, required this.index, required this.news});
  final int index;
  final NewsData news;
  var titleStyle = GoogleFonts.publicSans(
      textStyle: TextStyle(
          color: AppColorTheme.textColor.withOpacity(0.6),
          fontSize: 20,
          fontWeight: FontWeight.w500));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      // hoverColor: Colors.transparent,
      onTap: () {
        Get.offNamed('/news/?id=${news.id}');
      },
      child: Column(
        children: [
          index.isOdd ? oddCard() : evenCard(),
          const SizedBox(
            height: 16,
          ),
          Divider(
            thickness: 0.5,
            color: AppColorTheme.textColor.withOpacity(0.10),
          )
        ],
      ),
    );
  }

  oddCard() {
    return SizedBox(
      height: 160,
      child: Row(children: [
        sideBar(),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(news.titre! * 20,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: titleStyle),
              ),
              Text(formatedDateWithTime(news.updatedAt!),
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: AppColorTheme.textColor.withOpacity(0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w400))),
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Image.asset(
                'assets/images/ceni.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ]),
    );
  }

  evenCard() {
    return SizedBox(
      height: 160,
      child: Row(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Image.asset(
                'assets/images/ceni.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Text(news.titre! * 20,
                    textAlign: TextAlign.end,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: titleStyle),
              ),
              Text(formatedDateWithTime(news.updatedAt!),
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: AppColorTheme.textColor.withOpacity(0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w400))),
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        sideBar(),
      ]),
    );
  }

  Container sideBar() {
    return Container(
      width: 12,
      decoration: BoxDecoration(
          color: barColor(), borderRadius: BorderRadius.circular(8)),
    );
  }

  Color barColor() {
    if (index % 3 == 0) {
      return AppColorTheme.bleu;
    } else if (index % 3 == 1) {
      return AppColorTheme.jaune;
    } else {
      return AppColorTheme.rouge;
    }
  }
}
