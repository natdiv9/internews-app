import 'package:mediaapp/app/data/providers/candidats_provider.dart';

import '../models/candidat_model.dart';

class CandidatsRepository {
  final CandidatsProvider _api = CandidatsProvider();

  CandidatsRepository();

  Future<CandidatModel> getAll() {
    return _api.getAll();
  }

  getByID({required String id}) {
    return _api.getByID(id: id);
  }
}
