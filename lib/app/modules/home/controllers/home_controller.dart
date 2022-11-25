import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediaapp/app/core/utils/enum_utils.dart';

class HomeController extends GetxController {
  // final _currentTab = HomeTabsView.HOME.obs;
  // HomeTabsView get currentTab => _currentTab.value;
  // set currentTab(HomeTabsView value) => _currentTab.value = value;

  // final _currentCeniTab = CeniSubTabsView.PRESIDENTIELLE.obs;
  // CeniSubTabsView get currentCeniTab => _currentCeniTab.value;
  // set currentCeniTab(CeniSubTabsView value) => _currentCeniTab.value = value;

  final _isExpandedMenu = false.obs;
  bool get isExpandedMenu => _isExpandedMenu.value;
  set isExpandedMenu(bool value) => _isExpandedMenu.value = value;

  final _width = Get.width.obs;
  double get width => _width.value;
  set width(double value) => _width.value = value;

  // Current page
  final _currentPage = 'welcome'.obs;
  String get currentPage => _currentPage.value;
  set currentPage(String value) => _currentPage.value = value;

  // Current ceni subpage
  final _currentCeniPage = 'presidential'.obs;
  String get currentCeniPage => _currentCeniPage.value;
  set currentCeniPage(String value) => _currentCeniPage.value = value;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  closeDrawer() {
    scaffoldKey.currentState!.closeDrawer();
  }

  @override
  void onInit() {
    super.onInit();
    currentPage = Get.parameters['page'] ?? 'welcome';
    if (currentPage == 'ceni') {
      currentCeniPage = Get.parameters['subpage'] ?? 'presidential';
      isExpandedMenu = true;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
