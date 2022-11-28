import 'package:mediaapp/app/data/providers/candidats_provider.dart';

class CandidatsRepository {
  final CandidatsProvider _api = CandidatsProvider();

  CandidatsRepository();

  getAll() {
    return _api.getAll();
  }

  getByID({required String id}) {
    return _api.getByID(id: id);
  }
}
