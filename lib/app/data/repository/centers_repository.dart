import 'package:mediaapp/app/data/providers/centres_provider.dart';

import '../models/centres_model.dart';
import '../models/circonscription_model.dart';

class CentersRepository {
  final CentresProvider _api = CentresProvider();

  CentersRepository();

  Future<CentresModel> getAll(
      {required String province,
      required String ville,
      required String circonscription}) {
    return _api.getAll(
        province: province, ville: ville, circonscription: circonscription);
  }

  getProvinces() {
    return _api.getProvinces();
  }

  getVilles(String province) {
    return _api.getVillesByProvince(province);
  }

  getCirconscriptions(String ville) {
    return _api.getCirconscriptionsByVille(ville);
  }

  Future<CirconscriptionModel> getAllCirconscription(
      {required String province,
      required String ville,
      required String legislative}) {
    return _api.getAllCirconscription(
        province: province, ville: ville, legislative: legislative);
  }
}
