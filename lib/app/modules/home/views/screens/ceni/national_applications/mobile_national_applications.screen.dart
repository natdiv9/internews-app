import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import 'controllers/national_applications.controller.dart';

class MobileNationalApplicationsScreen extends StatelessWidget {
  MobileNationalApplicationsScreen({Key? key}) : super(key: key);

  NationalApplicationsController controller =
      Get.put(NationalApplicationsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView(

          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Députation nationale 2023",
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
              return (controller.candidatsList.length > 0)
                  ? SizedBox(
                      width: double.infinity,
                      // he)ight: MediaQuery.of(context).size.height,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: GridView.builder(
                            itemCount: controller.candidatsList.length,
                            // scrollDirection: Axis.vertical,
                            primary: false,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    // childAspectRatio: 2,
                                    crossAxisSpacing: 32,
                                    mainAxisSpacing: 32,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return Material(
                                child: InkWell(
                                  onTap: () {
                                    Get.offNamed(
                                        '/ceni?subpage=${controller.subpage}&id=${controller.candidatsList[index].id}');
                                  },
                                  child: Container(
                                    height: 462,
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
                                            height: 342,
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
                                          '$index',
                                          style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                  color:
                                                      AppColorTheme.textColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "${controller.candidatsList[index].user!.firstName} ${controller.candidatsList[index].user!.lastName}",
                                          style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                  color:
                                                      AppColorTheme.textColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "${controller.candidatsList[index].partiPolitique}",
                                          style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                  color:
                                                      AppColorTheme.textColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  : NewsCardShimmerWidget();
            }),
            const SizedBox(
              height: 24,
            ),
          ]),
    );
  }
}
