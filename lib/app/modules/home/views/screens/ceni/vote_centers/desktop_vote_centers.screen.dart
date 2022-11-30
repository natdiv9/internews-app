import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/vote_centers.controller.dart';

class DesktopVoteCentersScreen extends GetView<LogisticsController> {
  const DesktopVoteCentersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'DesktopVoteCentersScreen is working ',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
