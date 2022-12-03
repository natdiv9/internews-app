import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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

  // Current detail page id
  final _currentDetailPageId = ''.obs;
  String get currentDetailPageId => _currentDetailPageId.value;
  set currentDetailPageId(String value) => _currentDetailPageId.value = value;

  // Current detail candidate page id
  final _currentCandidatePageId = ''.obs;
  String get currentCandidatePageId => _currentCandidatePageId.value;

  final _currentCalendarPageId = ''.obs;
  String get currentCalendarPageId => _currentCalendarPageId.value;

  @override
  void onInit() {
    super.onInit();
    currentPage = Get.parameters['page'] ?? 'welcome';
    currentCeniPage = Get.parameters['subpage'] ?? 'presidential';

    if (currentPage == 'ceni' &&
        (currentCeniPage == 'national' ||
            currentCeniPage == 'presidential' ||
            currentCeniPage == 'provincial') &&
        Get.parameters['id'] != null &&
        Get.parameters['id'] != '') {
      _currentCandidatePageId.value = Get.parameters['id']!;
      isExpandedMenu = true;
      return;
    } else if (currentPage == 'ceni' &&
        currentCeniPage == 'calendar' &&
        Get.parameters['id'] != null &&
        Get.parameters['id'] != '') {
      _currentCalendarPageId.value = Get.parameters['id']!;
      isExpandedMenu = true;
      return;
    }
    if (Get.parameters['id'] != null && Get.parameters['id'] != '') {
      currentDetailPageId = Get.parameters['id']!;
      return;
    } else {}
    if (currentPage == 'ceni') {
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
