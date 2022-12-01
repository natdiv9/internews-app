import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/calendar/mobile_calendar.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/enrollment_centers/mobile_enrollment_centers.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/national_applications/mobile_national_applications.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/presidential_applications/mobile_presidential_applications.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/provincial_applications/mobile_provincial_applications.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/vote_centers/mobile_vote_centers.screen.dart';

class MobileCeniScreen extends GetView {
  String subPage;

  MobileCeniScreen({Key? key, required this.subPage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        switch (subPage) {
          case 'presidential':
            return MobilePresidentialApplicationsScreen();
          case 'national':
            return MobileNationalApplicationsScreen();
          case 'provincial':
            return MobileProvincialApplicationsScreen();
          case 'enrollment_centers':
            return MobileEnrollmentCentersScreen();
          case 'calendar':
            return MobileCalendarScreen();
          case 'vote_centers':
            return MobileVoteCentersScreen();
          default:
            return MobilePresidentialApplicationsScreen();
        }
      }),
    );
  }
}
