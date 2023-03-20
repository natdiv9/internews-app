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
  final _electoralCategory = <ElectoralCategorylModel>[].obs;
  List<ElectoralCategorylModel> get electoralCategory => _electoralCategory;
  set electoralCategory(value) => _electoralCategory.value = value;

  /// Get and Set for the electoral data
  final _electoralData = <ElectoralData>[].obs;
  List<ElectoralData> get electoralData => _electoralData;

  @override
  void onInit() {
    super.onInit();
    isBusy = true;
    // print('IS BUSY: $isBusy');
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
    _newsRepository.getAll().then((ElectoralModel? data) {
      electoralModel = data;
      _electoralData.value = electoralModel.data!;
      isBusy = false;
      // print('IS BUSY: $isBusy');
    });
  }

  getCategory(String id) {
    _newsRepository.getCategory().then((ElectoralModel? data) {
      electoralCategory = data;
      isBusy = false;
      // print('IS BUSY: $isBusy');
    });
  }
}
