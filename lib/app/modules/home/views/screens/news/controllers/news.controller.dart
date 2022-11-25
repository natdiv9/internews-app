import 'dart:core';

import 'package:get/get.dart';
import 'package:mediaapp/app/data/models/news_model.dart';
import 'package:mediaapp/app/data/repository/news_repository.dart';

class NewsController extends GetxController {
  // set newsList(value) => this._newsList.value = value;

  final NewsRepository _newsRepository = new NewsRepository();

  final _newsModel = NewsModel().obs;
  get newsModel => _newsModel.value;
  set newsModel(value) => _newsModel.value = value;

  final _newsList = <NewsData>[].obs;
  List<NewsData> get newsList => _newsList;

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

  getAll() {
    _newsRepository.getAll().then((NewsModel? data) {
      newsModel = data;
      _newsList.value = newsModel.data!;
    });
  }
}
