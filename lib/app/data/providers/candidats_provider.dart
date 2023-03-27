import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/helpers/const.dart';
import '../models/candidat_model.dart';

//nossa url base
const baseUrl = BASE_URL;

//nossa classe responsável por encapsular os métodos http
class CandidatsProvider {
//seu client http, pode ser http, http.Client, dio, apenas traga seus métodos para cá e funcionarão normalmente :D
  final http.Client httpClient = http.Client();
  CandidatsProvider();

  //um exemplo rápido, aqui estamos recuperando todos os posts disponibilizados pela api(100)
  Future<CandidatModel> getAll() async {
    try {
      var url = '$baseUrl/candidats';
      var response = await httpClient.get(Uri.parse(url));
      // print(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        CandidatModel candidatModel = CandidatModel.fromJson(jsonResponse);

        // print('DATA FETCH CandidatsProvider');
        // print(candidatsModel);
        return candidatModel;
      } else {
        print('erro');
        return Future.error('erro');
      }
    } catch (_) {
      print('ERREUR - CandidatsProvider');

      print(_.toString());
    }
    return Future.error('error');
  }

  Future<CandidatData?> getByID({required String id}) async {
    try {
      var uri = Uri.parse('$baseUrl/candidats/$id');
      var response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        CandidatData candidatData = CandidatData.fromJson(jsonResponse);

        return candidatData;
      } else {
        print('erro');
        return null;
      }
    } catch (_) {
      print('ERREURE - CandidatsProvider');

      print(_.toString());
    }
    return null;
  }
}
