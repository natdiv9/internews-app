import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mediaapp/app/data/models/calandars_model.dart';

//nossa url base
const baseUrl = 'https://infosnews.top-lum.com/api/calandars';

//nossa classe responsável por encapsular os métodos http
class CalandarsProvider {
//seu client http, pode ser http, http.Client, dio, apenas traga seus métodos para cá e funcionarão normalmente :D
  final http.Client httpClient = http.Client();
  CalandarsProvider();

  //um exemplo rápido, aqui estamos recuperando todos os posts disponibilizados pela api(100)
  Future<CalandarsModel> getAll() async {
    try {
      var response = await httpClient.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        CalandarsModel calandarsModel = CalandarsModel.fromJson(jsonResponse);

        // print('DATA FETCH CandidatsProvider');
        // print(candidatsModel);
        return calandarsModel;
      } else {
        print('erro');
        return Future.error(response.statusCode);
      }
    } catch (_) {
      print('ERREURE - calandarsProvider');

      print(_.toString());
    }
    return Future.error('error');
  }

  Future<CalandarsData?> getByID({required String id}) async {
    try {
      var uri = Uri.parse('${baseUrl}/$id');
      var response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        CalandarsData calandarsData = CalandarsData.fromJson(jsonResponse);

        return calandarsData;
      } else {
        print('erro');
        return null;
      }
    } catch (_) {
      print('ERREURE - CalandarsProvider');

      print(_.toString());
    }
    return null;
  }
}
