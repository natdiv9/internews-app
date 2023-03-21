import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/helpers/const.dart';
import '../models/faq_model.dart';

class FaqProvider {
  final http.Client httpClient = http.Client();
  FaqProvider();

  Future<FaqModel?> getAll() async {
    try {
      var uri = Uri.parse('$BASE_URL/faq');
      var response = await httpClient.get(uri);
      print('url: $uri');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        FaqModel faqModel = FaqModel.fromJson(jsonResponse);

        return faqModel;
      } else {
        print('STATUS ERROR');
        return null;
      }
    } catch (_) {
      print('ERREURE - FaqProvider');

      // print(_ClientSocketException.toString());
      print(_);
      return null;
    }
    // return null;
  }
}
