import 'package:get/get.dart';
import 'package:mediaapp/app/data/repository/candidats_repository.dart';

import '../../../../../../../data/models/candidat_model.dart';

class ProvincialApplicationsController extends GetxController {
  final CandidatsRepository _candidatsRepository = CandidatsRepository();

  final _candidatsModel = CandidatModel().obs;
  get candidatsModel => _candidatsModel;
  set candidatsModel(value) => _candidatsModel.value = value;

  final _candidatsList = <CandidatData>[].obs;
  List<CandidatData> get candidatsList => _candidatsList;

  final _subpage = ''.obs;
  String get subpage => _subpage.value;

  @override
  void onInit() {
    super.onInit();
    getAll();
    _subpage.value = Get.parameters['subpage']!;
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
    _candidatsRepository.getAll().then((CandidatModel data) {
      _candidatsModel.value = data;
      _candidatsList.value = _candidatsModel.value.data!;
    });
  }
}
