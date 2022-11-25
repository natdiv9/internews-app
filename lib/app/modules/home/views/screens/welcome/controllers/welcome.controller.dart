import 'package:get/get.dart';
import 'package:mediaapp/app/data/models/news_model.dart';
import 'package:mediaapp/app/data/repository/news_repository.dart';

class WelcomeController extends GetxController {
  final NewsRepository _newsRepository = new NewsRepository();

  final _newsModel = NewsModel().obs;
  get newsModel => _newsModel.value;
  set newsModel(value) => _newsModel.value = value;

  final _newsList = <NewsData>[].obs;
  List<NewsData> get newsList => _newsList;

  // News of type Education
  final _newsEducationModel = NewsModel().obs;
  get newsEducationModel => _newsEducationModel.value;
  set newsEducationModel(value) => _newsEducationModel.value = value;

  final _newsEducationList = <NewsData>[].obs;
  List<NewsData> get newsEducationList => _newsEducationList;

  @override
  void onInit() {
    super.onInit();

    getNews();
    getNewsEducation();
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
    _newsRepository.getAll().then((NewsModel? data) {
      newsModel = data;
      _newsList.value = newsModel.data!;
    });
  }

  getNewsEducation() {
    _newsRepository.getAll(type: 0).then((NewsModel? data) {
      newsEducationModel = data;
      _newsEducationList.value = newsEducationModel.data!;
    });
  }
}
