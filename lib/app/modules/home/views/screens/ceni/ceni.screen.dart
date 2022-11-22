import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediaapp/app/modules/home/controllers/home_controller.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/calendar/calendar.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/enrollment_centers/enrollment_centers.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/logistics/logistics.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/national_applications/national_applications.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/presidential_applications/presidential_applications.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/provincial_applications/provincial_applications.screen.dart';

class CeniScreen extends GetView {
  CeniScreen({Key? key}) : super(key: key);

  final HomeController _homeController = Get.put(HomeController());

  final List<GetView> ceni_screens = [
    PresidentialApplicationsScreen(),
    NationalApplicationsScreen(),
    ProvincialApplicationsScreen(),
    EnrollmentCentersScreen(),
    CalendarScreen(),
    LogisticsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: _homeController.currentCeniTab.index,
            children: ceni_screens,
          )),
    );
  }
}
