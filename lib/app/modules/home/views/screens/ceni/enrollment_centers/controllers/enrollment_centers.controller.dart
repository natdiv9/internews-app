import 'package:get/get.dart';
import 'package:mediaapp/app/data/models/centres_model.dart';
import 'package:mediaapp/app/data/repository/centers_repository.dart';

class EnrollmentCentersController extends GetxController {
  final CentersRepository _andidatsRepository = new CentersRepository();

  final _centresModel = CentresModel().obs;
  get centresModel => _centresModel.value;

  final _centresData = <CentresData>[].obs;
  List<CentresData> get centresData => _centresData;

  final _subpage = ''.obs;
  String get subpage => _subpage.value;

  @override
  void onInit() {
    super.onInit();
    // getAll();
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
    // _andidatsRepository.getAll().then((CentresModel? data) {
    //   if (data != null) {
    //     _centresModel.value = data;
    //     _centresData.value = data.data!;
    //   }
    // });
  }
}
