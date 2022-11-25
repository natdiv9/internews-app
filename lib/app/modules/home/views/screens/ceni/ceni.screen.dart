import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediaapp/app/modules/home/controllers/home_controller.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/calendar/calendar.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/enrollment_centers/enrollment_centers.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/vote_centers/vote_centers.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/national_applications/national_applications.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/presidential_applications/presidential_applications.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/provincial_applications/provincial_applications.screen.dart';

class CeniScreen extends GetView {
  String subPage;

  CeniScreen({Key? key, required this.subPage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        switch (subPage) {
          case 'presidential':
            return PresidentialApplicationsScreen();
          case 'national':
            return NationalApplicationsScreen();
          case 'provincial':
            return ProvincialApplicationsScreen();
          case 'enrollment_centers':
            return EnrollmentCentersScreen();
          case 'calendar':
            return CalendarScreen();
          case 'vote_centers':
            return VoteCentersScreen();
          default:
            return PresidentialApplicationsScreen();
        }
      }),
    );
  }
}
