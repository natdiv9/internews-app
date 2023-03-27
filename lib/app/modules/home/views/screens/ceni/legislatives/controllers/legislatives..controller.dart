import 'package:get/get.dart';
import 'package:mediaapp/app/data/models/circonscription_model.dart';

import '../../../../../../../data/models/candidat_model.dart';
import '../../../../../../../data/models/legislative_model.dart';
import '../../../../../../../data/repository/candidats_repository.dart';

class LegislativeController extends GetxController {
  final CandidatsRepository _candidatsRepository = CandidatsRepository();

  final _selectedLegislative = ''.obs;
  String get selectedLegislative => _selectedLegislative.value;
  set selectedLegislative(value) => _selectedLegislative.value = value;

  final _candidatModel = CandidatModel().obs;
  CandidatModel get candidatModel => _candidatModel.value;
  set candidatModel(value) => _candidatModel.value = value;

  final _candidatData = <CandidatData>[].obs;
  List<CandidatData> get candidatData => _candidatData;

  /// Get and Set for Legislatives
  final _legislatives = LegislativeModel().obs;
  LegislativeModel get legislatives => _legislatives.value;
  set legislatives(value) => _legislatives.value = value;

  /// Get and Set for the isBusy state
  final _isBusy = true.obs;
  bool get isBusy => _isBusy.value;
  set isBusy(value) => _isBusy.value = value;

  /// Get and Set for the is Loading state
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  final _subpage = ''.obs;
  String get subpage => _subpage.value;

  @override
  void onInit() {
    super.onInit();
    initialize();
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

  initialize() async {
    await getLegislatives();
    getAll();
  }

  /// Get Legislatives data
  getLegislatives() async {
    return await _candidatsRepository
        .getLislatives()
        .then((LegislativeModel? data) {
      if (data != null) {
        legislatives = data;
      }
    });
  }

  /// Gett all candidats data
  getAll() {
    isBusy = true;
    _candidatsRepository.getAll().then((CandidatModel? data) {
      candidatModel = data!;
      _candidatData.value = candidatModel.data!;
      // print(_candidatData);
      isBusy = false;
      // print('IS BUSY: $isBusy');
    });
  }

  void search(String searchKey) async {
    isLoading = true;
    await _candidatsRepository
        .search(searchKey: searchKey)
        .then((CandidatModel? data) {
      if (data != null) {
        candidatModel = data;
        _candidatData.value = data.data!;
        isLoading = false;
      }
    }).catchError((error) {
      isLoading = false;
      print(error);
    });
  }

  void getCandidatsByLegislative(String legislative) async {
    isLoading = true;
    await _candidatsRepository
        .getCandidatsByLegislative(legislative: legislative)
        .then((CandidatModel? data) {
      if (data != null) {
        candidatModel = data;
        _candidatData.value = data.data!;
        isLoading = false;
      }
    }).catchError((error) {
      isLoading = false;
      print(error);
    });
  }
}
