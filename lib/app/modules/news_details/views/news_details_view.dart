import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/news_details_controller.dart';

class NewsDetailsView extends GetView<NewsDetailsController> {
  const NewsDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      "Flutter vs HTML/CSS\nImplementation",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xff072d4b),
        fontSize: 24,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
