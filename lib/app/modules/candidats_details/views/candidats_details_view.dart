import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/views/news_card_shimmer.dart';

import '../controllers/candidats_details_controller.dart';

class CandidatsDetailsView extends StatelessWidget {
  CandidatsDetailsView({Key? key}) : super(key: key);

  CandidatsDetailsController controller = Get.put(CandidatsDetailsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        return (!controller.isLoading)
            ? ListView(
                children: [
                  Container(
                      height: Get.height * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/vote.jpg'),
                              fit: BoxFit.cover)),
                      child: Stack(clipBehavior: Clip.none, children: const [
                        Positioned(
                            left: 32,
                            bottom: -90,
                            child: CircleAvatar(
                              backgroundColor: AppColorTheme.whiteColor,
                              radius: 88,
                              child: CircleAvatar(
                                radius: 80,
                                backgroundColor: AppColorTheme.whiteColor,
                                backgroundImage:
                                    AssetImage('assets/images/candidat1.jpg'),
                              ),
                            ))
                      ])),
                  const SizedBox(
                    height: 106,
                  ),
                  Text(
                    "Martin Fayulu",
                    // "${controller.candidatData.user.firstName} ${controller.candidatData.user.lastName}",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: AppColorTheme.textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Candidat No ${controller.candidatData.id} - Parti LAMUKA",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: AppColorTheme.textColor.withOpacity(0.8),
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  _buildAproposWidget("À propos de moi"),
                  const SizedBox(
                    height: 32,
                  ),
                  _buildAproposWidget("Quelle est ma vision?"),
                  const SizedBox(
                    height: 32,
                  ),
                  _buildAproposWidget("Quelle est ma mission?"),
                  const SizedBox(
                    height: 32,
                  ),
                  _buildAproposWidget(
                      "Mon projet électoral pour les 5 ans à veni"),
                  const SizedBox(
                    height: 32,
                  ),
                  _buildGalleryWidget(),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              )
            : NewsCardShimmerWidget();
      }),
    );
  }

  Widget _buildAproposWidget(String sectionTitile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitile,
          textAlign: TextAlign.justify,
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  color: AppColorTheme.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
        Divider(
          // height: 1,
          color: AppColorTheme.textColor.withOpacity(0.1),
        ),
        SizedBox(
          height: 8,
          width: double.infinity,
        ),
        Text(
          "Et qui debitis dolorum velit. Aut libero voluptatem neque ea voluptatum et. Consectetur tempore consequatur voluptas consequatur asperiores repudiandae. Culpa rerum error est assumenda. Sint eligendi architecto similique consequatur placeat natus quos. Assumenda nemo distinctio iusto dolor incidunt magni. Cum et tempore quis quos odio suscipit enim veritatis. Sit eius dolor veniam quisquam architecto sint. Blanditiis illo eveniet et est id provident. Laboriosam eos maiores illum facilis aut maiores expedita. Libero ut doloremque illum quod. Dolorem temporibus eius error. Dolorum rerum ut veniam ut culpa laboriosam. Voluptatibus esse est ut vero numquam facere. Rerum modi dignissimos non asperiores veritatis voluptatibus provident.",
          textAlign: TextAlign.justify,
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: AppColorTheme.textColor.withOpacity(0.6),
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }

  Widget _buildGalleryWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gallerie',
          textAlign: TextAlign.justify,
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  color: AppColorTheme.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
        Divider(
          // height: 1,
          color: AppColorTheme.textColor.withOpacity(0.1),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // primary: false,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: AppColorTheme.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/gallerie${index + 1}.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Et qui debitis dolorum velit. Aut libero voluptatem neque ea voluptatum et.',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color:
                                      AppColorTheme.textColor.withOpacity(0.6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
