import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/themes/color_theme.dart';

class NewsCardWidget extends StatelessWidget {
  NewsCardWidget({super.key, required this.index});
  final int index;
  var titleStyle = GoogleFonts.publicSans(
      textStyle: TextStyle(
          color: AppColorTheme.textColor.withOpacity(0.8),
          fontSize: 20,
          fontWeight: FontWeight.w500));

  @override
  Widget build(BuildContext context) {
    return index.isOdd ? oddCard() : evenCard();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor' *
                        10,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                    style: titleStyle),
              ),
              Text('13 Novembre 2023, 14h30',
                  textAlign: TextAlign.start,
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
        Container(
          height: 130,
          width: 130,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Image.asset(
            'assets/images/ceni.jpg',
            fit: BoxFit.cover,
          ),
        )
      ]),
    );
  }

  evenCard() {
    return SizedBox(
      height: 160,
      child: Row(children: [
        Container(
          height: 130,
          width: 130,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Image.asset(
            'assets/images/ceni.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor' *
                        10,
                    textAlign: TextAlign.end,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                    style: titleStyle),
              ),
              Text('13 Novembre 2023, 14h30',
                  textAlign: TextAlign.start,
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
