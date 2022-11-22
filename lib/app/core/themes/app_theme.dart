import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_theme.dart';

final ThemeData appThemeData = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: AppColorTheme.textColor,
      displayColor: AppColorTheme.textColor,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColorTheme.primaryColor, brightness: Brightness.light),
    appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0.4,
        color: AppColorTheme.backgroundColor,
        elevation: 0),
    drawerTheme:
        DrawerThemeData(backgroundColor: AppColorTheme.backgroundColor),
    scaffoldBackgroundColor: AppColorTheme.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(AppColorTheme.primaryColor),
            backgroundColor:
                MaterialStateProperty.all(AppColorTheme.backgroundColor))));
