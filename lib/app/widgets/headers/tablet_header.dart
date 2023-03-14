import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/themes/color_theme.dart';

AppBar TabletAppBar(GlobalKey<ScaffoldState> scaffoldKey) {
  // HomeController controller = Get.put(HomeController());
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 2,
    centerTitle: false,
    toolbarHeight: 100,
    title: Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
        const SizedBox(
          width: 36,
        ),
        SizedBox(
          height: 46,
          width: 300,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Rechercher une information',
              hintStyle: GoogleFonts.roboto(
                color: AppColorTheme.textColor.withOpacity(0.3),
                fontSize: 14,
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
                borderSide: const BorderSide(
                  color: AppColorTheme.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
    automaticallyImplyLeading: false,
    actions: [
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
