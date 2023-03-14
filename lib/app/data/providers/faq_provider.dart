import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../models/faq_model.dart';

class FaqProvider {
  final baseUrl = 'https://infosnews.top-lum.com/api/faq';
  final http.Client httpClient = http.Client();
  FaqProvider();

  Future<FaqModel?> getAll({int type = 1}) async {
    try {
      var uri = Uri.parse('${baseUrl}?type=$type');
      var response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        FaqModel faqModel = FaqModel.fromJson(jsonResponse);
        // if (kDebugMode) {
        //   return jsonResponse.toString();
        // }
        // print('Le type de variable : ' + jsonResponse.runtimeType.toString());
        // List<NewsModel> listMyModel = [];

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
