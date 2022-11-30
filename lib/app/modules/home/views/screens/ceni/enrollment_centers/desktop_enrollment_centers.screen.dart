import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/enrollment_centers.controller.dart';

class DesktopEnrollmentCentersScreen
    extends GetView<EnrollmentCentersController> {
  const DesktopEnrollmentCentersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DesktopEnrollmentCentersScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DesktopEnrollmentCentersScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
