import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/electoral_model.dart';

class ElectoralProvider {
  final baseUrl = 'http://192.168.88.65:8000/api/electoral';
  final http.Client httpClient = http.Client();
  ElectoralProvider();

  Future<ElectoralModel?> getAll({int type = 1}) async {
    try {
      var uri = Uri.parse('$baseUrl?type=$type');
      var response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        ElectoralModel electoralModel = ElectoralModel.fromJson(jsonResponse);
        // if (kDebugMode) {
        //   return jsonResponse.toString();
        // }
        // print('Le type de variable : ' + jsonResponse.runtimeType.toString());
        // List<NewsModel> listMyModel = [];

        return electoralModel;
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
