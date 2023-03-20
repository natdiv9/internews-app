import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/electoral_category_model.dart';
import '../models/electoral_model.dart';

class ElectoralProvider {
  final baseUrl = 'http://192.168.88.65:8000/api';
  final http.Client httpClient = http.Client();
  ElectoralProvider();

  Future<ElectoralModel?> getAll({int categorylaw = 1}) async {
    try {
      var uri = Uri.parse('$baseUrl/electoral?categorylaw=$categorylaw');
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

  Future<ElectoralCategorylModel?> getCategory() async {
    try {
      var uri = Uri.parse('$baseUrl/categories/law');
      var response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        ElectoralCategorylModel electoralModel =
            ElectoralCategorylModel.fromJson(jsonResponse);

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
