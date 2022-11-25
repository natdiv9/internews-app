import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mediaapp/app/data/models/candidats_model.dart';

//nossa url base
const baseUrl = 'https://infosnews.top-lum.com/api/news';

//nossa classe responsável por encapsular os métodos http
class CandidatsProvider {
//seu client http, pode ser http, http.Client, dio, apenas traga seus métodos para cá e funcionarão normalmente :D
  final http.Client httpClient = http.Client();
  CandidatsProvider();

  //um exemplo rápido, aqui estamos recuperando todos os posts disponibilizados pela api(100)
  Future<CandidatsModel?> getAll() async {
    try {
      var response = await httpClient.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        CandidatsModel candidatsModel = CandidatsModel.fromJson(jsonResponse);
        // if (kDebugMode) {
        //   return jsonResponse.toString();
        // }
        // print('Le type de variable : ' + jsonResponse.runtimeType.toString());
        // List<NewsModel> listMyModel = [];

        return candidatsModel;
      } else {
        print('erro');
        return null;
      }
    } catch (_) {
      print('ERREURE - ');

      print(_.toString());
    }
    return null;
  }
}
