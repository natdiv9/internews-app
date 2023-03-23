import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import '../../../../../../data/models/centres_model.dart';
import '../../../../../../widgets/no_data_widget.dart';
import 'controllers/vote_centers.controller.dart';

class DesktopVoteCentersScreen extends StatefulWidget {
  DesktopVoteCentersScreen({Key? key}) : super(key: key);

  @override
  State<DesktopVoteCentersScreen> createState() =>
      _DesktopVoteCentersScreenState();
}

class _DesktopVoteCentersScreenState extends State<DesktopVoteCentersScreen> {
  VoteCentersController controller = Get.put(VoteCentersController());

  TextStyle titleStyle = GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold));

  TextStyle contentStyle = GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500));

  String? selectedProvince;

  String? selectedVille;

  String? selectedCirconscription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Obx(() {
        return (!controller.isBusy)
            ? controller.centresData.isEmpty &&
                    controller.provinces.data == null
                ? const NoDataWidget()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                          "Centres de vote",
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
                            _provincesDropDown(),
                            const SizedBox(width: 8),
                            if (controller.isProvinceSelected)
                              _villesDropDown(),
                            const SizedBox(width: 8),
                            if (controller.isVilleSelected)
                              _circonscriptionsDropDown()
                          ],
                        ),
                        controller.isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(32.0),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              )
                            : Expanded(
                                child:
                                    buildCenterTable(controller.centresData)),
                      ])
            : const NewsCardShimmerWidget();
      }),
    );
  }

  Flexible _provincesDropDown() {
    return Flexible(
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: AppColorTheme.primaryColor),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: selectedProvince,
              iconSize: 36,
              elevation: 1,
              focusColor: Colors.transparent,
              icon: const Icon(Icons.arrow_drop_down),
              hint: const Text('Provinces',
                  style: TextStyle(
                      color: AppColorTheme.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              items: [
                if (controller.provinces.data != null)
                  for (var prov in controller.provinces.data!)
                    DropdownMenuItem<String>(
                        value: prov.id.toString(),
                        child: Text(prov.designation!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)))
              ],
              onChanged: (value) {
                // controller.getByCategory(value.toString()),
                setState(() {
                  selectedProvince = value;
                  controller.getVilles(value!);
                });

                // print('VILLES: ${controller.villes.data}');
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _villesDropDown() {
    return Obx(() {
      return Flexible(
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(color: AppColorTheme.primaryColor),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: selectedVille,
                iconSize: 36,
                elevation: 1,
                focusColor: Colors.transparent,
                icon: const Icon(Icons.arrow_drop_down),
                hint: const Text('Villes',
                    style: TextStyle(
                        color: AppColorTheme.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                items: [
                  if (controller.villes.data != null)
                    for (var vil in controller.villes.data!)
                      DropdownMenuItem<String>(
                          value: vil.id.toString(),
                          child: Text(vil.designation!,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)))
                ],
                onChanged: (value) {
                  // controller.getByCategory(value.toString()),
                  // print('selected ville $value');

                  setState(() {
                    selectedVille = value;
                    controller.getCirconscriptions(value!);
                  });
                },
              ),
            ),
          ),
        ),
      );
    });
  }

  Flexible _circonscriptionsDropDown() {
    return Flexible(
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: AppColorTheme.primaryColor),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: selectedCirconscription,
              iconSize: 36,
              elevation: 1,
              focusColor: Colors.transparent,
              icon: const Icon(Icons.arrow_drop_down),
              hint: const Text('Circonscriptions',
                  style: TextStyle(
                      color: AppColorTheme.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              items: [
                if (controller.villes.data != null)
                  for (var cir in controller.circonscriptions)
                    DropdownMenuItem<String>(
                        value: cir.id.toString(),
                        child: Text(cir.designation!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)))
              ],
              onChanged: (value) {
                // controller.getByCategory(value.toString()),
                setState(() {
                  selectedCirconscription = value;
                  controller.getByCirconscription(value!);
                });
              },
            ),
          ),
        ),
      ),
    );
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
