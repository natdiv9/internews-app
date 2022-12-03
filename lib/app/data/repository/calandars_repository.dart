import 'package:mediaapp/app/data/providers/calandars_provider.dart';

class CalandarsRepository {
  final CalandarsProvider _api = CalandarsProvider();

  CalandarsRepository();

  getAll() {
    return _api.getAll();
  }

  getByID({required String id}) {
    return _api.getByID(id: id);
  }
}
