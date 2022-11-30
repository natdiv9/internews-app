import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DesktopCeniScreen extends GetView {
  String subPage;

  DesktopCeniScreen({Key? key, required this.subPage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        switch (subPage) {
          case 'presidential':
            return DesktopPresidentialApplicationsScreen();
          case 'national':
            return DesktopNationalApplicationsScreen();
          case 'provincial':
            return DesktopProvincialApplicationsScreen();
          case 'enrollment_centers':
            return DesktopEnrollmentCentersScreen();
          case 'calendar':
            return DesktopCalendarScreen();
          case 'vote_centers':
            return DesktopVoteCentersScreen();
          default:
            return DesktopPresidentialApplicationsScreen();
        }
      }),
    );
  }
}
