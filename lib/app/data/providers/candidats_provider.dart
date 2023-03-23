import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mediaapp/app/data/models/candidats_model.dart';

//nossa url base
const baseUrl = 'https://infosnews.top-lum.com/api/candidats';

//nossa classe responsável por encapsular os métodos http
class CandidatsProvider {
//seu client http, pode ser http, http.Client, dio, apenas traga seus métodos para cá e funcionarão normalmente :D
  final http.Client httpClient = http.Client();
  CandidatsProvider();

  //um exemplo rápido, aqui estamos recuperando todos os posts disponibilizados pela api(100)
  Future<CandidatsModel> getAll() async {
    try {
      var response = await httpClient.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        CandidatsModel candidatsModel = CandidatsModel.fromJson(jsonResponse);

        // print('DATA FETCH CandidatsProvider');
        // print(candidatsModel);
        return candidatsModel;
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

  Future<CandidatsData?> getByID({required String id}) async {
    try {
      var uri = Uri.parse('${baseUrl}/$id');
      var response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        CandidatsData candidatData = CandidatsData.fromJson(jsonResponse);

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
