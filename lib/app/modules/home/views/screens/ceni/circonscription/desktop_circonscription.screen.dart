import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/news_card_shimmer.dart';
import '../../../../../../data/models/circonscription_model.dart';
import '../../../../../../widgets/no_data_widget.dart';
import 'controllers/circonscription.controller.dart';

class DesktopCirconscriptionScreen extends GetView<CirconscriptionController> {
  DesktopCirconscriptionScreen({Key? key}) : super(key: key);

  CirconscriptionController controller = Get.put(CirconscriptionController());

  TextStyle titleStyle = GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold));

  TextStyle contentStyle = GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500));

  final TextEditingController _searchQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Obx(() {
        return (!controller.isBusy)
            ? controller.circonscriptionData.isEmpty
                ? const NoDataWidget()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                          "Circonscriptions",
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
                                  hintText: 'Rechercher une circonscription',
                                  hintStyle: GoogleFonts.roboto(
                                    color: AppColorTheme.textColor
                                        .withOpacity(0.6),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.search),
                                    color: AppColorTheme.textColor,
                                    onPressed: () {
                                      if (_searchQuery.text.trim().isNotEmpty) {
                                        controller
                                            .search(_searchQuery.text.trim());
                                      }
                                    },
                                  ),
                                  filled: true,
                                  fillColor: AppColorTheme.primaryColor
                                      .withOpacity(0.04),
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
                                      color: AppColorTheme.textColor
                                          .withOpacity(0),
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
                          ],
                        ),
                        controller.isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(32.0),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              )
                            : Expanded(
                                child: buildCenterTable(
                                    controller.circonscriptionData)),
                      ])
            : const NewsCardShimmerWidget();
      }),
    );
  }

  Widget buildCenterTable(List<CirconscriptionData> data) {
    return DataTable2(
      // columnSpacing: defaultPadding,
      // minWidth: 600,
      smRatio: 0.5,
      lmRatio: 2,
      columnSpacing: 0,
      horizontalMargin: 0,
      columns: [
        DataColumn2(
          label: Text("No", style: titleStyle),
          size: ColumnSize.S,
        ),
        DataColumn2(
          label: Text("Désignation", style: titleStyle),
        ),
        DataColumn2(
          label: Center(child: Text("Ville", style: titleStyle)),
        ),
        DataColumn2(
          label: Center(child: Text("Province", style: titleStyle)),
        ),
        // DataColumn2(
        //   label: Center(child: Text("Legislative", style: titleStyle)),
        // ),
      ],
      rows: List.generate(
        data.length,
        (index) {
          return dataRow(data[index], index + 1);
        },
      ),
    );
  }

  DataRow2 dataRow(CirconscriptionData data, int index) {
    return DataRow2(
      cells: [
        DataCell(Text(index.toString(),
            style: contentStyle.copyWith(fontWeight: FontWeight.bold))),
        DataCell(Text(data.designation!, style: contentStyle)),
        DataCell(
            Center(child: Text(data.ville!.designation!, style: contentStyle))),
        DataCell(Center(
            child:
                Text(data.ville!.province!.designation!, style: contentStyle))),
        // DataCell(Column(
        //   children: List.generate(
        //       data.circonscriptionLegislative!.length,
        //       (index) => Text(
        //           data.circonscriptionLegislative![index].legislative!
        //               .designation!,
        //           style: contentStyle)),
        // )),
      ],
    );
  }
}
