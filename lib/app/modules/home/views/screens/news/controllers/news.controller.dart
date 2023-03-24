import 'dart:core';
import 'dart:math';

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

  /// Get and Set for the isBusy state
  final _isBusy = true.obs;
  bool get isBusy => _isBusy.value;
  set isBusy(value) => _isBusy.value = value;

  @override
  void onInit() {
    super.onInit();
    getAll();
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
    _newsRepository.getAll().then((NewsModel? data) {
      newsModel = data;
      _newsList.value = newsModel.data!;
      isBusy = false;
    });
  }

  List<NewsData> getFiveNews() {
    if (_newsList.length <= 5) {
      return _newsList.sublist(0, 5);
    }
    var five = <NewsData>[];
    var randomIndex = <int>[];
    var length = _newsList.length;
    while (true) {
      var r = Random().nextInt(length);
      if (!randomIndex.contains(r)) {
        randomIndex.add(r);
      }
      if (randomIndex.length == 5) {
        break;
      }
    }

    for (var i in randomIndex) {
      five.add(_newsList[i]);
    }
    return five;
  }
}
