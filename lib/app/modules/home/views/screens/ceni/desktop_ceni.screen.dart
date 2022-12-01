import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/calendar/desktop_calendar.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/enrollment_centers/desktop_enrollment_centers.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/national_applications/desktop_national_applications.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/presidential_applications/desktop_presidential_applications.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/provincial_applications/desktop_provincial_applications.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/vote_centers/desktop_vote_centers.screen.dart';

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
