import 'package:get/get.dart';
import 'package:mediaapp/app/data/repository/centers_repository.dart';

import '../../../../../../../data/models/circonscription_model.dart';

class CirconscriptionController extends GetxController {
  final CentersRepository _centerRepository = CentersRepository();

  final _circonscriptionModel = CirconscriptionModel().obs;
  get circonscriptionModel => _circonscriptionModel.value;

  final _circonscriptionData = <CirconscriptionData>[].obs;
  List<CirconscriptionData> get circonscriptionData => _circonscriptionData;

  /// Get and Set for Provinces
  // final _provinces = ProvinceModel().obs;
  // ProvinceModel get provinces => _provinces.value;
  // set provinces(value) => _provinces.value = value;

  /// Get and Set for the Villes
  // final _villes = VilleModel().obs;
  // VilleModel get villes => _villes.value;
  // set villes(value) => _villes.value = value;

  /// Check if there is a province selected
  // final _isProvinceSelected = false.obs;
  // bool get isProvinceSelected => _isProvinceSelected.value;
  // set isProvinceSelected(value) => _isProvinceSelected.value = value;

  /// Check if there is a ville selected
  // final _isVilleSelected = false.obs;
  // bool get isVilleSelected => _isVilleSelected.value;
  // set isVilleSelected(value) => _isVilleSelected.value = value;

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
    // _subpage.value = Get.parameters['subpage']!;
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
    // await getProvinces();
    getAll();
  }

  getAll(
      {String legislative = '',
      String ville = '',
      String province = ''}) async {
    if (province.isNotEmpty || ville.isNotEmpty || legislative.isNotEmpty) {
      isLoading = true;
    } else {
      isBusy = true;
    }
    await _centerRepository
        .getAllCirconscription(
            province: province, ville: ville, legislative: legislative)
        .then((CirconscriptionModel? data) {
      if (data != null) {
        _circonscriptionModel.value = data;
        _circonscriptionData.value = data.data!;
        isBusy = false;
        isLoading = false;
      }
    }).catchError((error) {
      isBusy = false;
      print(error);
    });
  }

  /// Get provinces
  // getProvinces() async {
  //   return await _centerRepository.getProvinces().then((ProvinceModel? data) {
  //     if (data != null) {
  //       provinces = data;
  //     }
  //   });
  // }
}
