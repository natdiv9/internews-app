import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/helpers/const.dart';
import '../models/centres_model.dart';
import '../models/circonscription_model.dart';
import '../models/province_model.dart';
import '../models/ville_model.dart';

//nossa url base
const baseUrl = BASE_URL;

class CentresProvider {
  final http.Client httpClient = http.Client();
  CentresProvider();

  Future<CentresModel> getAll(
      {required String province,
      required String ville,
      required String circonscription}) async {
    try {
      var url = '$baseUrl/centres';
      if (province.isNotEmpty) {
        url += '?province=$province';
      }
      if (ville.isNotEmpty) {
        url += '&ville=$ville';
      }
      if (circonscription.isNotEmpty) {
        url += '&circonscription=$circonscription';
      }
      // print('URL: $url');
      var response = await httpClient.get(Uri.parse(url));
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

  Future<ProvinceModel> getProvinces() async {
    try {
      var response = await httpClient.get(Uri.parse('$baseUrl/provinces'));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        ProvinceModel provinceModel = ProvinceModel.fromJson(jsonResponse);

        return provinceModel;
      } else {
        print('erro');
        return Future.error('erro');
      }
    } catch (_) {
      print('ERREUR - provinceModel');

      print(_.toString());
    }
    return Future.error('error');
  }

  Future<List<VilleData>> getVillesByProvince(String province) async {
    try {
      var url = '$baseUrl/provinces/$province';
      var response = await httpClient.get(Uri.parse(url));
      // print(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        List<VilleData> data = [];
        for (var item in jsonResponse['villes']) {
          data.add(VilleData.fromJson(item));
        }

        // print('Liste des villes $province: $data');

        return data;
      } else {
        print('erro');
        return Future.error('erro');
      }
    } catch (_) {
      print('ERREUR - villesModel');

      print(_.toString());
    }
    return Future.error('error');
  }

  Future<List<Circonscription>> getCirconscriptionsByVille(ville) async {
    try {
      var response = await httpClient.get(Uri.parse('$baseUrl/villes/$ville'));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        List<Circonscription> data = [];
        for (var item in jsonResponse['circonscriptions']) {
          data.add(Circonscription.fromJson(item));
        }

        // print('Liste des Circonscription: ${data.toString()}');

        return data;
      } else {
        print('erro');
        return Future.error('erro');
      }
    } catch (_) {
      print('ERREUR - CirconscriptionModel');

      print(_.toString());
    }
    return Future.error('error');
  }

  Future<CirconscriptionModel> getAllCirconscription(
      {required String province,
      required String ville,
      required String legislative}) async {
    try {
      var url = '$baseUrl/communes';
      if (province.isNotEmpty) {
        url += '?province=$province';
      }
      if (ville.isNotEmpty) {
        url += '&ville=$ville';
      }
      if (legislative.isNotEmpty) {
        url += '&legislative=$legislative';
      }
      print('URL: $url');
      var response = await httpClient.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        CirconscriptionModel circonLegislativeModel =
            CirconscriptionModel.fromJson(jsonResponse);

        return circonLegislativeModel;
      } else {
        print('erro');
        return Future.error('erro');
      }
    } catch (_) {
      print('ERREURE - CirconscriptionModel');

      print(_.toString());
    }
    return Future.error('error');
  }

  Future<CirconscriptionModel> search({required String searchKey}) async {
    try {
      var url = '$baseUrl/communes?search=$searchKey';
      var response = await httpClient.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        CirconscriptionModel circonLegislativeModel =
            CirconscriptionModel.fromJson(jsonResponse);

        return circonLegislativeModel;
      } else {
        print('erro');
        return Future.error('erro');
      }
    } catch (_) {
      print('ERREURE - CirconscriptionModel Search');

      print(_.toString());
    }
    return Future.error('error');
  }
}
