import 'package:get/get.dart';
import 'package:mediaapp/app/data/repository/candidats_repository.dart';

import '../../../data/models/candidat_model.dart';

class CandidatsDetailsController extends GetxController {
  final CandidatsRepository _candidatsRepository = CandidatsRepository();

  /// Get and Set for the isBusy state
  final _isBusy = true.obs;
  bool get isBusy => _isBusy.value;
  set isBusy(value) => _isBusy.value = value;

  /// Get and Set for the is Loading state
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  final _candidatData = CandidatData().obs;
  CandidatData get candidatData => _candidatData.value;

  @override
  void onInit() {
    super.onInit();
    if (Get.parameters['id'] != null && Get.parameters['id'] != '') {
      getCandidat(Get.parameters['id']!);
    } else {
      _isLoading.value = true;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCandidat(String id) {
    isBusy = true;
    _candidatsRepository.getByID(id: id).then((CandidatData? data) {
      _candidatData.value = data!;
      isBusy = false;
    });
  }
}
