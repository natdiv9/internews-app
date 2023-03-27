import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/themes/color_theme.dart';

AppBar MobileHeader(GlobalKey<ScaffoldState> scaffoldKey) {
  // HomeController controller = Get.put(HomeController());
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 5,
    centerTitle: false,
    toolbarHeight: 80,
    title: Text(
      'U W A Z Z I',
      style: GoogleFonts.publicSans(
          textStyle: const TextStyle(
              color: AppColorTheme.bleu,
              fontSize: 32,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold)),
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
