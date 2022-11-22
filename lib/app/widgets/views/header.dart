import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/modules/home/controllers/home_controller.dart';

import '../../core/themes/color_theme.dart';

AppBar Header() {
  HomeController controller = Get.put(HomeController());
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0.4,
    leading: Obx(() => Center(
          child: Row(
            children: [
              (controller.width < 1100)
                  ? IconButton(
                      onPressed: () {},
                      icon: Icon(
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
        )),
    toolbarHeight: 84,
    //leadingWidth: 230,
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
                maximumSize: Size(200, 40)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.person_outline),
                  Text('Connexion'),
                  Icon(Icons.keyboard_arrow_down)
                ]),
          ),
        ),
      )
    ],
  );
}
