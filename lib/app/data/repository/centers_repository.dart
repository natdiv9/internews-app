import 'package:mediaapp/app/data/providers/centres_provider.dart';

class CentersRepository {
  final CentresProvider _api = CentresProvider();

  CentersRepository();

  getAll() {
    return _api.getAll();
  }
}
