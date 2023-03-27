import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

import '../../../../../../widgets/candidats_card/candidat_card.dart';
import '../../../../../../widgets/news_card_shimmer.dart';
import '../../../../../../widgets/no_data_widget.dart';
import 'controllers/legislatives..controller.dart';

class LegislativeDesktopScreen extends StatelessWidget {
  final TextEditingController _searchQuery = TextEditingController();

  LegislativeDesktopScreen({Key? key}) : super(key: key);

  LegislativeController controller = Get.put(LegislativeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Obx(() {
        return (!controller.isBusy)
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Candidats",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: AppColorTheme.textColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _searchQuery,
                        onSubmitted: (value) {
                          if (_searchQuery.text.trim().isNotEmpty) {
                            controller.search(_searchQuery.text.trim());
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Rechercher un candidat',
                          hintStyle: GoogleFonts.roboto(
                            color: AppColorTheme.textColor.withOpacity(0.6),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            color: AppColorTheme.textColor,
                            onPressed: () {
                              if (_searchQuery.text.trim().isNotEmpty) {
                                controller.search(_searchQuery.text.trim());
                              }
                            },
                          ),
                          filled: true,
                          fillColor:
                              AppColorTheme.primaryColor.withOpacity(0.04),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: AppColorTheme.textColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              width: 0,
                              color: AppColorTheme.textColor.withOpacity(0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: AppColorTheme.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    legislativeDropDown(),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                controller.isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : controller.candidatData.isEmpty
                        ? const NoDataWidget()
                        : Flexible(
                            child: GridView.custom(
                              gridDelegate: SliverWovenGridDelegate.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                pattern: [
                                  const WovenGridTile(1),
                                  const WovenGridTile(
                                    1,
                                    crossAxisRatio: 0.9,
                                    alignment: AlignmentDirectional.centerEnd,
                                  ),
                                ],
                              ),
                              childrenDelegate: SliverChildBuilderDelegate(
                                childCount: controller.candidatData.length,
                                (context, index) => CandidatCardWidget(
                                  candidat: controller.candidatData[index],
                                  subpage: controller.subpage,
                                ),
                              ),
                            ),
                          )
              ])
            : const NewsCardShimmerWidget();
      }),
    );
  }

  Widget legislativeDropDown() {
    return Flexible(
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: AppColorTheme.primaryColor),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: controller.selectedLegislative.isEmpty
                  ? null
                  : controller.selectedLegislative,
              iconSize: 36,
              elevation: 1,
              focusColor: Colors.transparent,
              icon: const Icon(Icons.arrow_drop_down),
              hint: const Text('Choisir une législative',
                  style: TextStyle(
                      color: AppColorTheme.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              items: [
                if (controller.legislatives.data != null)
                  for (var leg in controller.legislatives.data!)
                    DropdownMenuItem<String>(
                        value: leg.designation,
                        child: Text(leg.designation!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)))
              ],
              onChanged: (value) {
                controller.selectedLegislative = value;
                controller.getCandidatsByLegislative(value!);

                // print('VILLES: ${controller.villes.data}');
              },
            ),
          ),
        ),
      ),
    );
  }
}
