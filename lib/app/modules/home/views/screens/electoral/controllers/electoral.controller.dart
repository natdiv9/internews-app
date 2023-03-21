import 'package:get/get.dart';

import '../../../../../../data/models/electoral_category_model.dart';
import '../../../../../../data/models/electoral_model.dart';
import '../../../../../../data/repository/electoral_repository.dart';

class ElectoralController extends GetxController {
  final ElectoralRepository _newsRepository = ElectoralRepository();

  /// Get and Set for the isBusy state
  final _isBusy = true.obs;
  bool get isBusy => _isBusy.value;
  set isBusy(value) => _isBusy.value = value;

  /// Get and Set for the electoral model
  final _electoralModel = ElectoralModel().obs;
  get electoralModel => _electoralModel.value;
  set electoralModel(value) => _electoralModel.value = value;

  /// Get and Set for electoral category
  final _electoralCategory = ElectoralCategorylModel().obs;
  ElectoralCategorylModel get electoralCategory => _electoralCategory.value;
  set electoralCategory(value) => _electoralCategory.value = value;

  /// Get and Set for the electoral data
  final _electoralData = <ElectoralData>[].obs;
  List<ElectoralData> get electoralData => _electoralData;

  @override
  void onInit() {
    super.onInit();
    getCategory();
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

  /// Gett all electoral data
  getAll() {
    isBusy = true;
    _newsRepository.getAll().then((ElectoralModel? data) {
      electoralModel = data;
      _electoralData.value = electoralModel.data!;
      isBusy = false;
      // print('IS BUSY: $isBusy');
    });
  }

  /// Get electoral law by category
  getByCategory(String categorylaw) {
    isBusy = true;
    _newsRepository
        .getAll(categorylaw: categorylaw)
        .then((ElectoralModel? data) {
      electoralModel = data;
      _electoralData.value = electoralModel.data!;
      isBusy = false;
    });
  }

  getCategory() {
    _newsRepository.getCategory().then((ElectoralCategorylModel? data) {
      electoralCategory = data;
    });
  }
}
