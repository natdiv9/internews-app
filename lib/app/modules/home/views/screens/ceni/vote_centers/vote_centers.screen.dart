import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/vote_centers.controller.dart';

class VoteCentersScreen extends GetView<LogisticsController> {
  const VoteCentersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogisticsScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Vote centers is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
