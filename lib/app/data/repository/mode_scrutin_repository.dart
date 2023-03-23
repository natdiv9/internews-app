import '../providers/mode_scrutin_provider.dart';

class ModeScrutinRepository {
  final ModeScrutinProvider _api = ModeScrutinProvider();

  getAll() {
    return _api.getAll();
  }
}
