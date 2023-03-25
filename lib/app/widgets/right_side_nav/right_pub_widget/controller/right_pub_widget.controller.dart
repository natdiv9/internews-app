import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../data/models/candidat_model.dart';
import '../../../../data/repository/candidats_repository.dart';

class RightPubController extends GetxController {
  final CandidatsRepository _candidatsRepository = CandidatsRepository();

  final _candidatModel = CandidatModel().obs;
  CandidatModel get candidatModel => _candidatModel.value;
  set candidatModel(value) => _candidatModel.value = value;

  /// Get and Set for the isBusy state
  final _isBusy = true.obs;
  bool get isBusy => _isBusy.value;
  set isBusy(value) => _isBusy.value = value;

  /// Get and Set for the is Loading state
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;
  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  initialize() async {
    await getTopCandidats();
  }

  getTopCandidats() {
    isBusy = true;
    _candidatsRepository.getAll().then((CandidatModel? data) {
      candidatModel = data!;
      // print(_candidatData);
      isBusy = false;
      // print('IS BUSY: $isBusy');
    });
  }
}
