import 'package:mediaapp/app/data/providers/news_provider.dart';

class NewsRepository {
  final NewsProvider api = NewsProvider();

  NewsRepository();

  getAll() {
    return api.getAll();
  }
}
