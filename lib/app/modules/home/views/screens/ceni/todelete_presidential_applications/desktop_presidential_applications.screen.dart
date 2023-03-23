import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import 'controllers/presidential_applications.controller.dart';

class DesktopPresidentialApplicationsScreen extends StatelessWidget {
  DesktopPresidentialApplicationsScreen({Key? key}) : super(key: key);

  final PresidentialApplicationsController controller =
      Get.put(PresidentialApplicationsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView(

          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Candidats à la presidence de 2023",
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: AppColorTheme.textColor,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 24,
            ),
            Obx(() {
              return (controller.candidatsList.isNotEmpty)
                  ? SizedBox(
                      width: double.infinity,
                      // he)ight: MediaQuery.of(context).size.height,
                      child: StaggeredGrid.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          children: <Widget>[
                            for (var c in controller.candidatsList)
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: Material(
                                  child: InkWell(
                                    onTap: () {
                                      Get.offNamed(
                                          '/ceni?subpage=${controller.subpage}&id=${c.id}');
                                    },
                                    child: Container(
                                      // height: 462,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColorTheme.darkColor
                                                .withOpacity(0.04),
                                            blurRadius: 20,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                        color: AppColorTheme.whiteColor,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              // height: 342,
                                              // width: 125,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/candidat1.jpg'),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            '${c.id}',
                                            style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                    color:
                                                        AppColorTheme.textColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "${c.user!.firstName} ${c.user!.lastName}",
                                            style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                    color:
                                                        AppColorTheme.textColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "${c.partiPolitique}",
                                            style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                    color:
                                                        AppColorTheme.textColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ]))
                  : NewsCardShimmerWidget();
            }),
            const SizedBox(
              height: 24,
            ),
          ]),
    );
  }
}
