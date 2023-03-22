import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

import '../../data/models/electoral_model.dart';

class ElectoralItemCardView extends StatefulWidget {
  const ElectoralItemCardView({Key? key, required this.electoralData})
      : super(key: key);
  final ElectoralData electoralData;

  @override
  State<ElectoralItemCardView> createState() => _ElectoralItemCardViewState();
}

class _ElectoralItemCardViewState extends State<ElectoralItemCardView> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: AppColorTheme.darkColor.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 2),
          ),
        ],
        color: AppColorTheme.whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: const EdgeInsets.all(0),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                this.isExpanded = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                isExpanded: isExpanded,
                canTapOnHeader: true,
                backgroundColor: Colors.transparent,
                headerBuilder: (context, isExpanded) {
                  return Text(
                    widget.electoralData.titre,
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: AppColorTheme.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  );
                },
                body: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.electoralData.contenu * 30,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: AppColorTheme.textColor.withOpacity(0.6),
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
