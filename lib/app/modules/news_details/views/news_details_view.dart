import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediaapp/app/modules/home/controllers/home_controller.dart';

import '../controllers/news_details_controller.dart';

class NewsDetailsView extends GetView<NewsDetailsController> {
  NewsDetailsView({Key? key}) : super(key: key);

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Les details seront affichés ici",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff072d4b),
          fontSize: 24,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
