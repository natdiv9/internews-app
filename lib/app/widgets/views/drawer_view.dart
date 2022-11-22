import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/core/utils/enum_utils.dart';
import 'package:mediaapp/app/modules/home/controllers/home_controller.dart';

class DrawerView extends GetView {
  DrawerView({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 300,
        elevation: 0,
        child: SizedBox(
          height: double.infinity,
          width: 300,
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              _buildNavBarMenu('Accueil', Icons.home, HomeTabsView.HOME),
              _buildNavBarMenu(
                  'Actualités', Icons.newspaper, HomeTabsView.NEWS),
              _buildNavBarMenu(
                  'Education', Icons.school, HomeTabsView.EDUCATION),
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
                                  'Ceni', Icons.how_to_vote, HomeTabsView.CENI);
                            },
                            body: SizedBox(
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 32),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 16,
                                      ),
                                      _buildCeniSubNavBarMenu(
                                          'Canditature Presidentielle',
                                          CeniSubTabsView.PRESIDENTIELLE),
                                      _buildCeniSubNavBarMenu(
                                          'Canditature Nationale',
                                          CeniSubTabsView.NATIONALE),
                                      _buildCeniSubNavBarMenu(
                                          'Canditature Provinciale',
                                          CeniSubTabsView.PROVINCIALE),
                                      _buildCeniSubNavBarMenu(
                                          'Centres D’enrolement',
                                          CeniSubTabsView.CENTRES_ENROLEMENT),
                                      _buildCeniSubNavBarMenu(
                                          'Calendrier electoral',
                                          CeniSubTabsView.CALENDRIER),
                                      _buildCeniSubNavBarMenu('Logistique',
                                          CeniSubTabsView.LOGISTIQUE)
                                    ]),
                              ),
                            ))
                      ],
                    )),
              ),
            ],
          ),
        ));
  }

  Widget _buildNavBarMenu(String title, IconData icon, HomeTabsView tab) {
    return TextButton(
        onPressed: () {
          if (tab != _homeController.currentTab) {
            _homeController.currentTab = tab;
          }

          if (tab == HomeTabsView.CENI) {
            _homeController.isExpandedMenu = !_homeController.isExpandedMenu;
          }
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
          foregroundColor: AppColorTheme.primaryColor.withOpacity(0.1),
        ),
        clipBehavior: Clip.hardEdge,
        child: Obx(() => Container(
              height: 50,
              decoration: BoxDecoration(
                  color: (tab == _homeController.currentTab)
                      ? AppColorTheme.primaryColor.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.only(
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
                      color: (tab == _homeController.currentTab)
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
                                color: (tab == _homeController.currentTab)
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

  Widget _buildCeniSubNavBarMenu(String title, CeniSubTabsView tab) {
    return Obx(() => Material(
          color: (tab == _homeController.currentCeniTab)
              ? AppColorTheme.primaryColor.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(40),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(40)),
          child: InkWell(
              onTap: () {
                if (_homeController.currentTab != HomeTabsView.CENI) {
                  _homeController.currentTab = HomeTabsView.CENI;
                }
                if (tab != _homeController.currentCeniTab) {
                  _homeController.currentCeniTab = tab;
                }
              },
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(40)),
              // radius: 1,
              autofocus: true,
              overlayColor: MaterialStateProperty.all(
                  AppColorTheme.primaryColor.withOpacity(0.05)),
              child: Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: (tab == _homeController.currentCeniTab)
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
                                  color: (tab == _homeController.currentCeniTab)
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
