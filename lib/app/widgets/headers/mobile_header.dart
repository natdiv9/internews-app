import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediaapp/app/modules/home/controllers/home_controller.dart';

import '../../core/themes/color_theme.dart';

AppBar MobileHeader(GlobalKey<ScaffoldState> scaffoldKey) {
  HomeController controller = Get.put(HomeController());
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 5,
    centerTitle: false,
    toolbarHeight: 80,
    title: Image.asset(
      'assets/images/logo.png',
      scale: 5,
      fit: BoxFit.cover,
    ),
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: AppColorTheme.textColor,
          )),
      IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: AppColorTheme.textColor,
          )),
    ],
  );
}
