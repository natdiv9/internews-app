import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mediaapp/app/modules/candidats_details/views/mobile_candidats_details_view.dart';
import 'package:mediaapp/app/modules/home/controllers/home_controller.dart';
import 'package:mediaapp/app/modules/home/views/screens/ceni/mobile_ceni.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/education/mobile_education.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/news/mobile_news.screen.dart';
import 'package:mediaapp/app/modules/home/views/screens/welcome/mobile_welcome.screen.dart';
import 'package:mediaapp/app/modules/news_details/views/mobile_news_details_view.dart';
import 'package:mediaapp/app/widgets/drawers/desktop_drawer_view.dart';
import 'package:mediaapp/app/widgets/drawers/mobile_drawer_view.dart';
import 'package:mediaapp/app/widgets/headers/mobile_header.dart';

class MobileView extends GetView<HomeController> {
  MobileView({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MobileHeader(scaffoldKey),
      drawer: MobileDrawerView(scaffoldKey: scaffoldKey),
      body: Obx(() => _buidBody()),
    );
  }

  Widget _buidBody() {
    switch (controller.currentPage) {
      case 'welcome':
        return MobileWelcomeScreen();
      case 'news':
        if (controller.currentDetailPageId != null &&
            controller.currentDetailPageId != '') {
          return MobileNewsDetailsView();
        }
        return MobileNewsScreen();
      case 'education':
        return MobileEducationScreen();
      case 'ceni':
        if (controller.currentCandidatePageId != null &&
            controller.currentCandidatePageId != '') {
          return MobileCandidatsDetailsView();
        }
        return MobileCeniScreen(subPage: controller.currentCeniPage);
      default:
        return MobileWelcomeScreen();
    }
  }
}
