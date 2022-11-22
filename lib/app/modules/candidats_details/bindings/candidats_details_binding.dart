import 'package:get/get.dart';

import '../controllers/candidats_details_controller.dart';

class CandidatsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CandidatsDetailsController>(
      () => CandidatsDetailsController(),
    );
  }
}
