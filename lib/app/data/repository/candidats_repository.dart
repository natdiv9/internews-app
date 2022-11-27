import 'package:mediaapp/app/data/providers/candidats_provider.dart';

class CandidatsRepository {
  final CandidatsProvider api = CandidatsProvider();

  CandidatsRepository();

  getAll({int type = 1}) {
    return api.getAll();
  }
}
