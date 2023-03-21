import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/helpers/const.dart';
import '../models/electoral_category_model.dart';
import '../models/electoral_model.dart';

class ElectoralProvider {
  final baseUrl = BASE_URL;
  final http.Client httpClient = http.Client();
  ElectoralProvider();

  Future<ElectoralModel?> getAll({String categorylaw = ''}) async {
    try {
      var arg = categorylaw == '' ? '' : '?categoryLaw=$categorylaw';
      var uri = Uri.parse('$baseUrl/electoral$arg');
      print('URI: $uri');
      var response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        ElectoralModel electoralModel = ElectoralModel.fromJson(jsonResponse);

        return electoralModel;
      } else {
        print('STATUS ERROR');
        return null;
      }
    } catch (_) {
      print('ERREURE - ElectoralProvider');

      // print(_ClientSocketException.toString());
      print(_);
      return null;
    }
    // return null;
  }

  Future<ElectoralCategorylModel?> getCategory() async {
    try {
      var uri = Uri.parse('$baseUrl/category_electoral');
      var response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        ElectoralCategorylModel electoralCategorylModel =
            ElectoralCategorylModel.fromJson(jsonResponse);

        return electoralCategorylModel;
      } else {
        print('STATUS ERROR');
        return null;
      }
    } catch (error) {
      print('ERREURE - ElectoralProvider - getCategory');
      // print(_ClientSocketException.toString());
      print(error.toString());
      return null;
    }
    // return null;
  }
}
