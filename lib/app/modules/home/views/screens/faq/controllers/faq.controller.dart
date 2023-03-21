import 'package:get/get.dart';

import '../../../../../../data/models/faq_model.dart';
import '../../../../../../data/repository/faq_repository.dart';

class FAQController extends GetxController {
  final FaqRepository _faqRepository = FaqRepository();
  final _faqModel = FaqModel().obs;
  get faqModel => _faqModel.value;
  set faqModel(value) => _faqModel.value = value;

  final _faqList = <FaqData>[].obs;
  List<FaqData> get faqList => _faqList;

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
    _faqRepository.getAll().then((FaqModel? data) {
      faqModel = data;
      _faqList.value = faqModel.data!;
      isBusy = false;
      // print('IS BUSY: $isBusy');
    }).catchError((e) {
      isBusy = false;
      print(e);
    });
  }
}
