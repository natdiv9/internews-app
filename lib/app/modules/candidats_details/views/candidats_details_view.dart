import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/candidats_details_controller.dart';

class CandidatsDetailsView extends GetView<CandidatsDetailsController> {
  const CandidatsDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CandidatsDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CandidatsDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
