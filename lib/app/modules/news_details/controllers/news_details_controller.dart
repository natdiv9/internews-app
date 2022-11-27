import 'package:get/get.dart';
import 'package:mediaapp/app/data/models/news_model.dart';
import 'package:mediaapp/app/data/repository/news_repository.dart';

class NewsDetailsController extends GetxController {
  NewsRepository _newsRepository = NewsRepository();

  final _newsDada = NewsData().obs;
  NewsData get newsData => _newsDada.value;

  final _isLoading = true.obs;
  get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    if (Get.parameters['id'] != null && Get.parameters['id'] != '') {
      getNews(Get.parameters['id']!);
    } else {
      _isLoading.value = true;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getNews(String id) {
    _newsRepository.getByID(id: id).then((NewsData? data) {
      _newsDada.value = data!;
      _isLoading.value = false;
    });
  }
}
