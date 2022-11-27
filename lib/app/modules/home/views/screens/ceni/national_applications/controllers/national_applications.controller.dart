import 'package:get/get.dart';
import 'package:mediaapp/app/data/models/candidats_model.dart';
import 'package:mediaapp/app/data/repository/candidats_repository.dart';

class NationalApplicationsController extends GetxController {
  CandidatsRepository _candidatsRepository = CandidatsRepository();

  final _candidatsModel = CandidatsModel().obs;
  get candidatsModel => _candidatsModel;
  set candidatsModel(value) => _candidatsModel.value = value;

  final _candidatsList = <CandidatsData>[].obs;
  List<CandidatsData> get candidatsList => _candidatsList;

  @override
  void onInit() {
    super.onInit();
    getAll();
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
    _candidatsRepository.getAll().then((CandidatsModel? data) {
      candidatsModel = data;
      _candidatsList.value = candidatsModel.data!;
    });
  }
}
