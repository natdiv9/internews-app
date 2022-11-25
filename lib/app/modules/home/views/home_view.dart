import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/ceni.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/education/education.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/news/news.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/welcome/welcome.screen.dart';
import 'package:mediaapp/app/widgets/views/drawer_view.dart';
import 'package:mediaapp/app/widgets/views/right_side_nav/right_side_nav_view.dart';
import '../../../widgets/views/header.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final List<Widget> screens = [
    WelcomeScreen(),
    NewsScreen(),
    EducationScreen(),
    CeniScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        appBar: Header(),
        drawer: Obx(
            () => controller.width < 1100 ? DrawerView() : const SizedBox()),
        body: LayoutBuilder(builder: (context, constraints) {
          // controller.width = constraints.maxWidth;
          if (constraints.maxWidth < 500) {
            return Obx(() => IndexedStack(
                  index: controller.currentTab.index,
                  children: screens,
                ));
          } else if (constraints.maxWidth < 1100) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  //flex: 2,
                  child: Obx(() => IndexedStack(
                        index: controller.currentTab.index,
                        children: screens,
                      )),
                ),
                RightSideNavView(),
              ],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerView(),
              Expanded(
                flex: 2,
                child: Obx(() => IndexedStack(
                      index: controller.currentTab.index,
                      children: screens,
                    )),
              ),
              RightSideNavView(),
            ],
          );
        }));
  }
}
