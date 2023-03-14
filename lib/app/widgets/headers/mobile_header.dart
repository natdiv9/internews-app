import 'package:flutter/material.dart';
import '../../core/themes/color_theme.dart';

AppBar MobileHeader(GlobalKey<ScaffoldState> scaffoldKey) {
  // HomeController controller = Get.put(HomeController());
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 5,
    centerTitle: false,
    toolbarHeight: 80,
    title: Image.asset(
      'assets/images/logo.png',
      scale: 5,
      fit: BoxFit.fitHeight,
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
