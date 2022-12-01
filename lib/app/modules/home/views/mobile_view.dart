import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mediaapp/app/modules/candidats_details/views/desktop_candidats_details_view.dart';
import 'package:mediaapp/app/modules/home/controllers/home_controller.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/desktop_ceni.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/education/desktop_education.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/news/desktop_news.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/welcome/desktop_welcome.screen.dart';
import 'package:mediaapp/app/modules/news_details/views/desktop_news_details_view.dart';

class MobileView extends GetView<HomeController> {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    switch (controller.currentPage) {
      case 'welcome':
        return DesktopWelcomeScreen();
      case 'news':
        if (controller.currentDetailPageId != null &&
            controller.currentDetailPageId != '') {
          return DesktopNewsDetailsView();
        }
        return DesktopNewsScreen();
      case 'education':
        return DesktopEducationScreen();
      case 'ceni':
        if (controller.currentCandidatePageId != null &&
            controller.currentCandidatePageId != '') {
          return DesktopCandidatsDetailsView();
        }
        return DesktopCeniScreen(subPage: controller.currentCeniPage);
      default:
        return DesktopWelcomeScreen();
    }
  }
}
