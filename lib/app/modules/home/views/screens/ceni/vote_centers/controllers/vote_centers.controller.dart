import 'package:get/get.dart';
import 'package:mediaapp/app/data/models/centres_model.dart';
import 'package:mediaapp/app/data/repository/centers_repository.dart';

import '../../../../../../../data/models/circonscription_model.dart';
import '../../../../../../../data/models/province_model.dart';
import '../../../../../../../data/models/ville_model.dart';

class VoteCentersController extends GetxController {
  final CentersRepository _centerRepository = CentersRepository();

  final _centresModel = CentresModel().obs;
  get centresModel => _centresModel.value;

  final _centresData = <CentresData>[].obs;
  List<CentresData> get centresData => _centresData;

  /// Get and Set for Provinces
  final _provinces = ProvinceModel().obs;
  ProvinceModel get provinces => _provinces.value;
  set provinces(value) => _provinces.value = value;

  /// Get and Set for the Villes
  final _villes = VilleModel().obs;
  VilleModel get villes => _villes.value;
  set villes(value) => _villes.value = value;

  /// Get and Set for the Circonscriptions
  final _circonscriptions = <CirconscriptionData>[].obs;
  List<CirconscriptionData> get circonscriptions => _circonscriptions;

  // final _subpage = ''.obs;
  // String get subpage => _subpage.value;

  /// Get and Set for the isBusy state
  final _isBusy = true.obs;
  bool get isBusy => _isBusy.value;
  set isBusy(value) => _isBusy.value = value;

  /// Get and Set for the is Loading state
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  /// Check if there is a province selected
  final _isProvinceSelected = false.obs;
  bool get isProvinceSelected => _isProvinceSelected.value;
  set isProvinceSelected(value) => _isProvinceSelected.value = value;

  /// Check if there is a ville selected
  final _isVilleSelected = false.obs;
  bool get isVilleSelected => _isVilleSelected.value;
  set isVilleSelected(value) => _isVilleSelected.value = value;

  /// Check if there is a circonscription selected
  final _isCirconscriptionSelected = false.obs;
  bool get isCirconscriptionSelected => _isCirconscriptionSelected.value;
  set isCirconscriptionSelected(value) =>
      _isCirconscriptionSelected.value = value;

  @override
  void onInit() {
    super.onInit();
    initialize();
    //  _subpage.value = Get.parameters['subpage']!;
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
    await getProvinces();
    getAll();
  }

  getAll(
      {String province = '',
      String ville = '',
      String circonscription = ''}) async {
    if (province.isNotEmpty || ville.isNotEmpty || circonscription.isNotEmpty) {
      isLoading = true;
    } else {
      isBusy = true;
    }
    await _centerRepository
        .getAll(
            province: province, ville: ville, circonscription: circonscription)
        .then((CentresModel? data) {
      if (data != null) {
        _centresModel.value = data;
        _centresData.value = data.data!;
        isBusy = false;
        isLoading = false;
      }
    }).catchError((error) {
      isBusy = false;
      print(error);
    });
  }

  /// Get provinces
  getProvinces() async {
    return await _centerRepository.getProvinces().then((ProvinceModel? data) {
      if (data != null) {
        provinces = data;
      }
    });
  }

  /// Get villes by province
  getVilles(String province) async {
    var provName = provinces.data!
        .firstWhere((element) => element.id == int.parse(province))
        .designation;
    // print(provName);
    return _centerRepository
        .getVilles(province)
        .then((List<VilleData>? data) async {
      if (data != null) {
        villes.data = data;
        await getAll(province: provName!);
        isProvinceSelected = true;
        // print(villes.data);
      }
    });
  }

  /// Get circonscriptions by ville
  getCirconscriptions(String ville) {
    var villeName = villes.data!
        .firstWhere((element) => element.id == int.parse(ville))
        .designation;
    var provId = villes.data!
        .firstWhere((element) => element.id == int.parse(ville))
        .provinceId;
    var provName = provinces.data!
        .firstWhere((element) => element.id == provId)
        .designation;
    print('villeName & provName: $villeName & $provName');
    _centerRepository
        .getCirconscriptions(ville)
        .then((List<CirconscriptionData>? data) async {
      if (data != null) {
        _circonscriptions.value = data;
        await getAll(province: provName!, ville: villeName!);
        isVilleSelected = true;
        isLoading = false;
      }
    });
  }

  /// Get by circonscription
  getByCirconscription(String circonscription) {
    var circName = circonscriptions
        .firstWhere((element) => element.id == int.parse(circonscription))
        .designation;
    var villeId = circonscriptions
        .firstWhere((element) => element.id == int.parse(circonscription))
        .villeId;
    var villeName =
        villes.data!.firstWhere((element) => element.id == villeId).designation;
    var provId =
        villes.data!.firstWhere((element) => element.id == villeId).provinceId;
    var provName = provinces.data!
        .firstWhere((element) => element.id == provId)
        .designation;
    // print('$provName/$villeName/$circName');
    getAll(province: provName!, ville: villeName!, circonscription: circName!);
  }
}
