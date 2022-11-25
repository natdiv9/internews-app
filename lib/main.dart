import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/core/themes/app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "MediaApp",
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      initialRoute: '/home/welcome',
      getPages: AppPages.routes,
      defaultTransition: Transition.fade,
    ),
  );
}
