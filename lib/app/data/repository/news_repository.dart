import 'package:mediaapp/app/data/providers/news_provider.dart';

class NewsRepository {
  final NewsProvider api = NewsProvider();

  NewsRepository();

  getAll({int type = 1}) {
    return api.getAll(type: type);
  }
}
