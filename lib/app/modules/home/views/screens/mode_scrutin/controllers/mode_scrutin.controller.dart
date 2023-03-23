import 'package:get/get.dart';

import '../../../../../../data/models/mode_scrutins_model.dart';
import '../../../../../../data/repository/mode_scrutin_repository.dart';

class ModeScrutinController extends GetxController {
  final ModeScrutinRepository _modeScrutinRepository = ModeScrutinRepository();
  final _modeScrutinModel = ModeScrutinsModel().obs;
  ModeScrutinsModel get modeScrutinModel => _modeScrutinModel.value;
  set modeScrutinModel(value) => _modeScrutinModel.value = value;

  final _modeScrutinList = <ModeScrutinsData>[].obs;
  List<ModeScrutinsData> get modeScrutinList => _modeScrutinList;

  /// Get and Set for the isBusy state
  final _isBusy = true.obs;
  bool get isBusy => _isBusy.value;
  set isBusy(value) => _isBusy.value = value;

  @override
  void onInit() {
    super.onInit();
    getAll();
  }

  /// Gett all faq data
  getAll() {
    isBusy = true;
    _modeScrutinRepository.getAll().then((ModeScrutinsModel? data) {
      modeScrutinModel = data;
      _modeScrutinList.value = modeScrutinModel.data!;
      isBusy = false;
      // print('IS BUSY: $isBusy');
    }).catchError((e) {
      isBusy = false;
      print(e);
    });
  }
}
