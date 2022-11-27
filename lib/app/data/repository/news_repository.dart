import 'package:mediaapp/app/data/providers/news_provider.dart';

class NewsRepository {
  final NewsProvider _api = NewsProvider();

  NewsRepository();

  getAll({int type = 1}) {
    return _api.getAll(type: type);
  }

  getByID({required String id}) {
    return _api.getByID(id: id);
  }
}
