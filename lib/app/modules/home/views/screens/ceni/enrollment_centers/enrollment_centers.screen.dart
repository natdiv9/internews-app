import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/enrollment_centers.controller.dart';

class EnrollmentCentersScreen extends GetView<EnrollmentCentersController> {
  const EnrollmentCentersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EnrollmentCentersScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EnrollmentCentersScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
