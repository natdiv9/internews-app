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

  @override
  void onInit() {
    super.onInit();
  }
}
