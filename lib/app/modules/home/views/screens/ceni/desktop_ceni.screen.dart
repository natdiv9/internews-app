import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/calendar/desktop_calendar.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/vote_centers/desktop_vote_centers.screen.dart';

import 'circonscription/desktop_circonscription.screen.dart';
import 'legislatives/legislatives.desktop.dart';

class DesktopCeniScreen extends GetView {
  String subPage;

  DesktopCeniScreen({Key? key, required this.subPage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        switch (subPage) {
          case 'legislative':
            return LegislativeDesktopScreen();
          case 'circonscription':
            return DesktopCirconscriptionScreen();
          case 'calendar':
            return DesktopCalendarScreen();
          case 'vote_centers':
            return DesktopVoteCentersScreen();
          default:
            return LegislativeDesktopScreen();
        }
      }),
    );
  }
}
