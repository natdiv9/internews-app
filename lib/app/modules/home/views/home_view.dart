import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediaapp/app/modules/candidats_details/views/candidats_details_view.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/ceni.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/education/education.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/news/news.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/welcome/welcome.screen.dart';
import 'package:mediaapp/app/modules/news_details/views/news_details_view.dart';
import 'package:mediaapp/app/widgets/views/drawer_view.dart';
import 'package:mediaapp/app/widgets/views/right_side_nav/right_side_nav_view.dart';
import '../../../widgets/views/header.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

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
            return Obx(() => _buildPage());
          } else if (constraints.maxWidth < 1100) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  //flex: 2,
                  child: Obx(() => _buildPage()),
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
                child: Obx(() => _buildPage()),
              ),
              RightSideNavView(),
            ],
          );
        }));
  }

  Widget _buildPage() {
    switch (controller.currentPage) {
      case 'welcome':
        return WelcomeScreen();
      case 'news':
        if (controller.currentDetailPageId != null &&
            controller.currentDetailPageId != '') {
          return NewsDetailsView();
        }
        return NewsScreen();
      case 'education':
        return EducationScreen();
      case 'ceni':
        if (controller.currentCandidatePageId != null &&
            controller.currentCandidatePageId != '') {
          return CandidatsDetailsView();
        }
        return CeniScreen(subPage: controller.currentCeniPage);
      default:
        return WelcomeScreen();
    }
  }
}
