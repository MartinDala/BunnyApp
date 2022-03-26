import 'dart:convert';

import 'package:bunny/api/api_util.dart';
import 'package:bunny/api/endpoint.dart';
import 'package:bunny/models/listing_reproductions_model.dart';
import 'package:bunny/models/reproduction_model.dart';
import 'package:bunny/repositories/list_reproductions_repository/listing_reproductions_repository.dart';
import 'package:bunny/services/dio_service.dart';
import 'package:bunny/services/prefs_service.dart';

import 'package:http/http.dart' as http;

class ListingReproductionsImp implements ListingReproductionsRepository {
  final DioService _dioservice;

  ListingReproductionsImp(this._dioservice);

  @override
  Future<List<listingreproduction>?> getReproductions(id) async {
    var readToken = await PrefService.token_read();
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + readToken.toString()
    };
    var url = Uri.parse(Endpoint().api + API.REQUEST_REPRODUCTIONS + "/${id}");
    var response = await http.get(url, headers: header);

    var jsonResponse = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return (jsonResponse as List)
          .map((e) => listingreproduction.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
