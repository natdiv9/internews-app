import 'package:get/get.dart';
import 'package:mediaapp/app/data/models/calandars_model.dart';
import 'package:mediaapp/app/data/repository/calandars_repository.dart';

class CalendarController extends GetxController {
  final CalandarsRepository _andidatsRepository = CalandarsRepository();

  final _calandarsModel = CalandarsModel().obs;
  get calandarsModel => _calandarsModel.value;

  final _calandarsList = <CalandarsData>[].obs;
  List<CalandarsData> get calandarsList => _calandarsList;

  final _subpage = ''.obs;
  String get subpage => _subpage.value;

  /// Get and Set for the isBusy state
  final _isBusy = true.obs;
  bool get isBusy => _isBusy.value;
  set isBusy(value) => _isBusy.value = value;

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
    isBusy = true;
    _andidatsRepository.getAll().then((CalandarsModel? data) {
      if (data != null) {
        isBusy = false;
        _calandarsModel.value = data;
        _calandarsList.value = data.data!;
      }
    }).catchError((error) {
      isBusy = false;
      print(error);
    });
  }
}
