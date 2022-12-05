import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/centres_model.dart';

//nossa url base
const baseUrl = 'https://infosnews.top-lum.com/api/centres';

class CentresProvider {
  final http.Client httpClient = http.Client();
  CentresProvider();

  Future<CentresModel> getAll() async {
    try {
      var response = await httpClient.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        CentresModel centresModel = CentresModel.fromJson(jsonResponse);

        return centresModel;
      } else {
        print('erro');
        return Future.error('erro');
      }
    } catch (_) {
      print('ERREURE - CentresProvider');

      print(_.toString());
    }
    return Future.error('error');
  }
}
