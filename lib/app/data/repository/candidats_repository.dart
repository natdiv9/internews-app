import 'package:mediaapp/app/data/providers/candidats_provider.dart';

import '../models/candidat_model.dart';
import '../models/legislative_model.dart';

class CandidatsRepository {
  final CandidatsProvider _api = CandidatsProvider();

  CandidatsRepository();

  Future<CandidatModel> getAll() {
    return _api.getAll();
  }

  getByID({required String id}) {
    return _api.getByID(id: id);
  }

  Future<CandidatModel> search({required String searchKey}) {
    return _api.search(searchKey: searchKey);
  }

  Future<LegislativeModel> getLislatives() {
    return _api.getLislatives();
  }

  Future<CandidatModel> getCandidatsByLegislative(
      {required String legislative}) {
    return _api.getCandidatsByLegislative(legislative: legislative);
  }
}
