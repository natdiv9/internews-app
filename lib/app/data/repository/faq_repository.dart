import '../providers/faq_provider.dart';

class FaqRepository {
  final FaqProvider _api = FaqProvider();

  FaqRepository();

  getAll() {
    return _api.getAll();
  }
}
