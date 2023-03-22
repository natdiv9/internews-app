import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/helpers/date_functions.dart';
import '../../core/themes/color_theme.dart';
import '../../data/models/calandars_model.dart';

class CalandarCardWidget extends StatefulWidget {
  const CalandarCardWidget({
    super.key,
    required this.calandarsData,
  });
  final CalandarsData calandarsData;

  @override
  State<CalandarCardWidget> createState() => _CalandarCardWidgetState();
}

class _CalandarCardWidgetState extends State<CalandarCardWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
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
            body: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.calandarsData.content!,
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: AppColorTheme.textColor.withOpacity(0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            headerBuilder: (context, isExpanded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    formatedDate(
                      widget.calandarsData.dateStart!,
                    ),
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: AppColorTheme.textColor.withOpacity(0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    widget.calandarsData.title!,
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: AppColorTheme.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ));
  }
}
