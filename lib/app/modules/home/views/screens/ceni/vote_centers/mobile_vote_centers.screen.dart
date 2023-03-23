import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import '../../../../../../data/models/centres_model.dart';
import '../../../../../../widgets/no_data_widget.dart';
import 'controllers/vote_centers.controller.dart';

class MobileVoteCentersScreen extends StatelessWidget {
  MobileVoteCentersScreen({Key? key}) : super(key: key);
  VoteCentersController controller = Get.put(VoteCentersController());
  TextStyle titleStyle = GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
  TextStyle contentStyle = GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500));

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (!controller.isBusy)
          ? controller.centresData.isEmpty
              ? const NoDataWidget()
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Centres de vote",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              color: AppColorTheme.textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildCenterTable(controller.centresData),
                  )),
                ])
          : const NewsCardShimmerWidget();
    });
  }

  Widget buildCenterTable(List<CentresData> data) {
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
            numeric: true),
        DataColumn2(
            label: Center(child: Text("Circonscription", style: titleStyle)),
            numeric: true),
        DataColumn2(
            label: Center(child: Text("Province", style: titleStyle)),
            numeric: true),
      ],
      rows: List.generate(
        data.length,
        (index) {
          return dataRow(data[index], index + 1);
        },
      ),
    );
  }

  DataRow2 dataRow(CentresData data, int index) {
    return DataRow2(
      cells: [
        DataCell(Text(index.toString(),
            style: contentStyle.copyWith(fontWeight: FontWeight.bold))),
        DataCell(Text(data.designation!, style: contentStyle)),
        DataCell(
            Center(child: Text(data.ville!.designation!, style: contentStyle))),
        DataCell(Center(
            child:
                Text(data.circonscription!.designation!, style: contentStyle))),
        DataCell(Center(
            child:
                Text(data.ville!.province!.designation!, style: contentStyle))),
      ],
    );
  }
}
