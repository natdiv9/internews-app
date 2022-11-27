import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mediaapp/app/data/models/news_model.dart';
import 'package:meta/meta.dart';

//nossa url base
const baseUrl = 'https://infosnews.top-lum.com/api/news';

//nossa classe responsável por encapsular os métodos http
class NewsProvider {
//seu client http, pode ser http, http.Client, dio, apenas traga seus métodos para cá e funcionarão normalmente :D
  final http.Client httpClient = http.Client();
  NewsProvider();

  //um exemplo rápido, aqui estamos recuperando todos os posts disponibilizados pela api(100)
  Future<NewsModel?> getAll({int type = 1}) async {
    try {
      var uri = Uri.parse('${baseUrl}?type=$type');
      var response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        NewsModel newsModel = NewsModel.fromJson(jsonResponse);
        // if (kDebugMode) {
        //   return jsonResponse.toString();
        // }
        // print('Le type de variable : ' + jsonResponse.runtimeType.toString());
        // List<NewsModel> listMyModel = [];

        return newsModel;
      } else {
        print('erro');
        return null;
      }
    } catch (_) {
      print('ERREURE - NewsProvider');

      print(_.toString());
    }
    return null;
  }

  Future<NewsData?> getByID({required String id}) async {
    try {
      var uri = Uri.parse('${baseUrl}/$id');
      var response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        NewsData newsData = NewsData.fromJson(jsonResponse);

        return newsData;
      } else {
        print('erro');
        return null;
      }
    } catch (_) {
      print('ERREURE - NewsProvider');

      print(_.toString());
    }
    return null;
  }
}
