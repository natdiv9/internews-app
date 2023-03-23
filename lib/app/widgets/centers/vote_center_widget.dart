import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/themes/color_theme.dart';
import '../../data/models/centres_model.dart';

class VoteCenterWidget extends StatefulWidget {
  const VoteCenterWidget({
    super.key,
    required this.voteCenter,
  });
  final CentresData voteCenter;

  @override
  State<VoteCenterWidget> createState() => _VoteCenterWidgetState();
}

class _VoteCenterWidgetState extends State<VoteCenterWidget> {
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
                widget.voteCenter.designation!,
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: AppColorTheme.textColor.withOpacity(0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            headerBuilder: (context, isExpanded) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.voteCenter.designation!,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: AppColorTheme.textColor.withOpacity(0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    widget.voteCenter.circonscriptionId as String,
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
