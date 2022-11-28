import 'package:get/get.dart';
import 'package:mediaapp/app/data/models/candidats_model.dart';
import 'package:mediaapp/app/data/repository/candidats_repository.dart';

class NationalApplicationsController extends GetxController {
  final CandidatsRepository _candidatsRepository = CandidatsRepository();

  final _candidatsModel = CandidatsModel().obs;
  get candidatsModel => _candidatsModel;
  set candidatsModel(value) => _candidatsModel.value = value;

  final _candidatsList = <CandidatsData>[].obs;
  List<CandidatsData> get candidatsList => _candidatsList;

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
    _candidatsRepository.getAll().then((CandidatsModel data) {
      _candidatsModel.value = data;
      _candidatsList.value = _candidatsModel.value.data!;
    });
  }
}
