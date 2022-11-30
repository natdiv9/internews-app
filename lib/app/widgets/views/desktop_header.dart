import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/modules/home/controllers/home_controller.dart';

import '../../core/themes/color_theme.dart';

AppBar DesktopHeader() {
  // HomeController controller = Get.put(HomeController());
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 2,
    centerTitle: false,
    toolbarHeight: 100,
    title: Row(
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
        Container(
          height: 70,
          width: 210,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        (controller.width > 600)
            ? const SizedBox(
                width: 120,
              )
            : Container(),
        (controller.width > 750)
            ? SizedBox(
                height: 46,
                width: 495,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Rechercher une information',
                    hintStyle: GoogleFonts.roboto(
                      color: AppColorTheme.textColor.withOpacity(0.3),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: AppColorTheme.textColor,
                    ),
                    filled: true,
                    fillColor: AppColorTheme.primaryColor.withOpacity(0.04),
                    //hoverColor: AppColorTheme.textColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColorTheme.textColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        width: 0,
                        color: AppColorTheme.textColor.withOpacity(0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        color: AppColorTheme.primaryColor,
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    ),
    automaticallyImplyLeading: false,
    actions: [
      (controller.width < 600)
          ? IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColorTheme.textColor,
              ))
          : Container(),
      SizedBox(
        width: 12,
      ),
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
