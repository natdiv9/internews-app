import 'package:mediaapp/app/data/providers/news_provider.dart';

import '../providers/electoral_provider.dart';

class ElectoralRepository {
  final ElectoralProvider _api = ElectoralProvider();

  ElectoralRepository();

  getAll({int type = 1}) {
    return _api.getAll(type: type);
  }

  getCategory() {
    return _api.getCategory();
  }
}
