import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/vote_centers.controller.dart';

class MobileVoteCentersScreen extends GetView<LogisticsController> {
  const MobileVoteCentersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'MobileVoteCentersScreen is working ',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
