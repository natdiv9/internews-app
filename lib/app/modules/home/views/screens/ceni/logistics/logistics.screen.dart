import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/logistics.controller.dart';

class LogisticsScreen extends GetView<LogisticsController> {
  const LogisticsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogisticsScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LogisticsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
