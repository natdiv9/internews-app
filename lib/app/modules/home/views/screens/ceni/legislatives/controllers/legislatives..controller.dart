import 'package:get/get.dart';

class LegislativesController extends GetxController {
  final _subpage = ''.obs;
  String get subpage => _subpage.value;

  @override
  void onInit() {
    super.onInit();
    getAll();
    // _subpage.value = Get.parameters['subpage']!;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAll() {
    // _candidatsRepository.getAll().then((CandidatsModel data) {
    //   _candidatsModel.value = data;
    //   _candidatsList.value = _candidatsModel.value.data!;
    // });
  }
}
