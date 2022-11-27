import 'package:get/get.dart';
import 'package:mediaapp/app/data/models/news_model.dart';

class NewsDetailsController extends GetxController {
  final _newsDada = NewsData().obs;
  NewsData get newsData => _newsDada.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
