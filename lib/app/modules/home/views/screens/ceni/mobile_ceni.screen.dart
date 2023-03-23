import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/calendar/mobile_calendar.screen.dart';

import 'package:mediaapp/app/modules/home/views/screens/ceni/vote_centers/mobile_vote_centers.screen.dart';

class MobileCeniScreen extends GetView {
  String subPage;

  MobileCeniScreen({Key? key, required this.subPage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        switch (subPage) {
          case 'legislative':
            return Placeholder();
          case 'circonscription':
            return Placeholder();
          case 'calendar':
            return MobileCalendarScreen();
          case 'vote_centers':
            return MobileVoteCentersScreen();
          default:
            return Placeholder();
        }
      }),
    );
  }
}
