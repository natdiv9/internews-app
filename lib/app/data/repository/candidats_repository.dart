import 'package:mediaapp/app/data/providers/candidats_provider.dart';

class CandidatsRepository {
  final CandidatsProvider api = CandidatsProvider();

  CandidatsRepository();

  getAll() {
    return api.getAll();
  }
}
