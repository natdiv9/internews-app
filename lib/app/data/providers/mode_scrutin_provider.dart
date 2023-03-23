import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/helpers/const.dart';
import '../models/faq_model.dart';
import '../models/mode_scrutins_model.dart';

class ModeScrutinProvider {
  final http.Client httpClient = http.Client();

  Future<ModeScrutinsModel?> getAll() async {
    try {
      var uri = Uri.parse('$BASE_URL/mode_scrutins');
      var response = await httpClient.get(uri);
      // print('url: $uri');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            Map<String, dynamic>.from(json.decode(response.body));
        ModeScrutinsModel modeScrutinsModel =
            ModeScrutinsModel.fromJson(jsonResponse);

        print('Mode Scrutin: $modeScrutinsModel');

        return modeScrutinsModel;
      } else {
        print('STATUS ERROR');
        return null;
      }
    } catch (_) {
      print('ERREURE - ModeScrutinProvider');

      // print(_ClientSocketException.toString());
      print(_);
      return null;
    }
    // return null;
  }
}
