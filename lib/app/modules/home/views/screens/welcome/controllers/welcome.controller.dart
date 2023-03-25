import 'package:get/get.dart';
import 'package:mediaapp/app/data/models/news_model.dart';
import 'package:mediaapp/app/data/repository/news_repository.dart';

class WelcomeController extends GetxController {
  final NewsRepository _newsRepository = new NewsRepository();

  final _newsModel = NewsModel().obs;
  NewsModel get newsModel => _newsModel.value;
  set newsModel(value) => _newsModel.value = value;

  final _newsList = <NewsData>[].obs;
  List<NewsData> get newsList => _newsList;

  /// Get and Set for the isBusy state
  final _isBusy = true.obs;
  bool get isBusy => _isBusy.value;
  set isBusy(value) => _isBusy.value = value;

  @override
  void onInit() {
    super.onInit();

    getNews();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getNews() {
    isBusy = true;
    _newsRepository.getAll().then((NewsModel? data) {
      if (data != null) {
        newsModel = data;
        _newsList.value = newsModel.data!;
        isBusy = false;
      }
    });
  }
}
