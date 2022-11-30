import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TabletView extends StatelessWidget {
  const TabletView({super.key});

  @override
  Widget build(BuildContext context) {
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
