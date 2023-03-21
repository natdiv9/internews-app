import '../providers/electoral_provider.dart';

class ElectoralRepository {
  final ElectoralProvider _api = ElectoralProvider();

  ElectoralRepository();

  getAll({String categorylaw = ''}) {
    return _api.getAll(categorylaw: categorylaw);
  }

  getCategory() {
    return _api.getCategory();
  }
}
