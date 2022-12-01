import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/enrollment_centers.controller.dart';

class MobileEnrollmentCentersScreen
    extends GetView<EnrollmentCentersController> {
  const MobileEnrollmentCentersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobileEnrollmentCentersScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MobileEnrollmentCentersScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
