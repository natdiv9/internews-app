import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/modules/home/controllers/home_controller.dart';

class DesktopDrawerView extends GetView {
  DesktopDrawerView({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // width: 300,
        elevation: 0,
        child: SizedBox(
          height: double.infinity,

          // width: 300,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                _buildNavBarMenu('Accueil', Icons.home_outlined, 'welcome'),
                _buildNavBarMenu('Actualités', Icons.newspaper, 'news'),
                _buildNavBarMenu(
                    'Loi électorale', Icons.gavel_outlined, 'electoral'),
                _buildNavBarMenu(
                    'Mode de scrutin', Icons.how_to_vote_outlined, 'scrutin'),
                SingleChildScrollView(
                  child: Obx(() => ExpansionPanelList(
                        elevation: 0,
                        expansionCallback: (int index, bool isExpanded) {
                          _homeController.isExpandedMenu = !isExpanded;
                        },
                        expandedHeaderPadding: EdgeInsets.zero,
                        children: [
                          ExpansionPanel(
                              backgroundColor: Colors.transparent,
                              canTapOnHeader: true,
                              isExpanded: _homeController.isExpandedMenu,
                              headerBuilder: (context, isExpanded) {
                                return _buildNavBarMenu(
                                    'Ceni', Icons.more_vert, 'ceni');
                              },
                              body: SizedBox(
                                width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 32),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        _buildCeniSubNavBarMenu(
                                            'Canditature Presidentielle',
                                            'presidential'),
                                        _buildCeniSubNavBarMenu(
                                            'Canditature Nationale',
                                            'national'),
                                        _buildCeniSubNavBarMenu(
                                            'Canditature Provinciale',
                                            'provincial'),
                                        _buildCeniSubNavBarMenu(
                                            'Calendrier electoral', 'calendar'),
                                        _buildCeniSubNavBarMenu(
                                            'Centres d’enrolement',
                                            'enrollment_centers'),
                                        _buildCeniSubNavBarMenu(
                                            'Centre de vote', 'vote_centers'),
                                      ]),
                                ),
                              ))
                        ],
                      )),
                ),
                _buildNavBarMenu('FAQ', Icons.quiz_outlined, 'faq'),
              ],
            ),
          ),
        ));
  }

  Widget _buildNavBarMenu(String title, IconData icon, String route) {
    return TextButton(
        onPressed: () {
          if (route == 'ceni') {
            Get.offNamed("/ceni/?subpage=presidential");
          } else {
            Get.offNamed("/$route");
          }
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
          foregroundColor: AppColorTheme.primaryColor.withOpacity(0.1),
        ),
        clipBehavior: Clip.hardEdge,
        child: Obx(() => Container(
              height: 50,
              decoration: BoxDecoration(
                  color: (route == _homeController.currentPage)
                      ? AppColorTheme.primaryColor.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: (route == _homeController.currentPage)
                          ? AppColorTheme.primaryColor
                          : AppColorTheme.textColor,
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: (route == _homeController.currentPage)
                                    ? AppColorTheme.primaryColor
                                    : AppColorTheme.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget _buildCeniSubNavBarMenu(String title, String ceniSubRoute) {
    return Obx(() => Material(
          color: (ceniSubRoute == _homeController.currentCeniPage)
              ? AppColorTheme.primaryColor.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(40),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(40)),
          child: InkWell(
              onTap: () {
                Get.offNamed("/ceni/?subpage=$ceniSubRoute");
              },
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(40)),
              // radius: 1,
              autofocus: true,
              overlayColor: MaterialStateProperty.all(
                  AppColorTheme.primaryColor.withOpacity(0.05)),
              child: SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: (ceniSubRoute == _homeController.currentCeniPage)
                            ? AppColorTheme.primaryColor
                            : AppColorTheme.textColor.withOpacity(0.9),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: (ceniSubRoute ==
                                          _homeController.currentCeniPage)
                                      ? AppColorTheme.primaryColor
                                      : AppColorTheme.textColor
                                          .withOpacity(0.9),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
