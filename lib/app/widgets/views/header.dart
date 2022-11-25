import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/modules/home/controllers/home_controller.dart';

import '../../core/themes/color_theme.dart';

AppBar Header() {
  HomeController controller = Get.put(HomeController());
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 2,
    centerTitle: false,
    toolbarHeight: 84,
    title: Obx(
      () => Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (controller.width < 1100)
              ? IconButton(
                  onPressed: () {
                    controller.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: AppColorTheme.textColor,
                  ))
              : Container(),
          Text(
            'I N T E R N E W S 🇨🇩',
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    color: AppColorTheme.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    ),
    automaticallyImplyLeading: false,
    actions: [
      SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              // backgroundColor: Colors.
              foregroundColor: AppColorTheme.textColor,
            ),
            child: Obx(() =>
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Icon(Icons.person_outline),
                  (controller.width > 600) ? Text('Connexion') : Container(),
                  Icon(Icons.keyboard_arrow_down)
                ])),
          ),
        ),
      )
    ],
  );
}
