import 'package:get/get.dart';
import 'package:mediaapp/app/data/models/candidats_model.dart';
import 'package:mediaapp/app/data/repository/candidats_repository.dart';

class CandidatsDetailsController extends GetxController {
  final CandidatsRepository _candidatsRepository = CandidatsRepository();

  final _isLoading = true.obs;
  get isLoading => _isLoading.value;

  final _candidatData = CandidatsData().obs;
  CandidatsData get candidatData => _candidatData.value;

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
    _candidatsRepository.getByID(id: id).then((CandidatsData? data) {
      _candidatData.value = data!;
      _isLoading.value = false;
    });
  }
}
