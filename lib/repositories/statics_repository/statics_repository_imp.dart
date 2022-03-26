import 'dart:convert';

import 'package:bunny/api/api_util.dart';
import 'package:bunny/api/endpoint.dart';
import 'package:bunny/models/estatisticas_model.dart';
import 'package:bunny/repositories/statics_repository/statics_repository.dart';
import 'package:bunny/services/dio_service.dart';
import 'package:bunny/services/prefs_service.dart';

import 'package:http/http.dart' as http;

class StaticsRepositoryImp implements StaticsRepository {
  final DioService _dioservice;

  StaticsRepositoryImp(this._dioservice);

  @override
  Future<List<estatisticas>?> getStatics(id) async {
    var readToken = await PrefService.token_read();
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + readToken.toString()
    };
    var url = Uri.parse(Endpoint().api + API.REQUEST_STATICS + "/${id}");
    var response = await http.get(url, headers: header);

    var jsonResponse = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return (jsonResponse as List)
          .map((e) => estatisticas.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
