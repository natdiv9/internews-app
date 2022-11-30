import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediaapp/app/modules/home/views/desktop_view.dart';
import 'package:mediaapp/app/modules/home/views/mobile_view.dart';
import 'package:mediaapp/app/modules/home/views/tablet_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return MobileView();
      } else if (constraints.maxWidth < 1100) {
        return TabletView();
      }
      return DesktopView();
    });
  }
}
