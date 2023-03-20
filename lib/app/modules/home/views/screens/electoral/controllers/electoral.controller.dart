import 'package:get/get.dart';

import '../../../../../../data/models/electoral_model.dart';
import '../../../../../../data/repository/electoral_repository.dart';

class ElectoralController extends GetxController {
  final ElectoralRepository _newsRepository = ElectoralRepository();

  final _electoralModel = ElectoralModel().obs;
  get electoralModel => _electoralModel.value;
  set electoralModel(value) => _electoralModel.value = value;

  final _electoralData = <ElectoralData>[].obs;
  List<ElectoralData> get electoralData => _electoralData;

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
    _newsRepository.getAll().then((ElectoralModel? data) {
      electoralModel = data;
      _electoralData.value = electoralModel.data!;
    });
  }
}
