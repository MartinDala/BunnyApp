import 'dart:convert';

import 'package:bunny/api/api_util.dart';
import 'package:bunny/api/endpoint.dart';
import 'package:bunny/models/listing_model.dart';
import 'package:bunny/services/dio_service.dart';
import 'package:bunny/services/prefs_service.dart';

import 'package:http/http.dart' as http;
import 'listing_repository.dart';

class ListingRepositoryImp implements ListingRepository {
  final DioService _dioservice;

  ListingRepositoryImp(this._dioservice);

  @override
  Future<List<listing>?> getListing(id) async {
    var readToken = await PrefService.token_read();
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + readToken.toString()
    };
    var url =
        Uri.parse(Endpoint().api + API.REQUEST_COELHO_LIST_BY_ID + "/${id}");
    var response = await http.get(url, headers: header);

    var jsonResponse = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return (jsonResponse as List).map((e) => listing.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<listing>?> getListingForCategory(id, categoria) async {
    var readToken = await PrefService.token_read();
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + readToken.toString()
    };
    var url = Uri.parse(Endpoint().api +
        API.REQUEST_COELHO_LIST_BY_CATEGORY +
        "/${id}/${categoria}");
    var response = await http.get(url, headers: header);

    var jsonResponse = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return (jsonResponse as List).map((e) => listing.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<listing>?> deleteListing() async {
    var readToken = await PrefService.token_read();
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + readToken.toString()
    };
    var url = Uri.parse(Endpoint().api + API.DELETE_COELHO);
    var response = await http.get(url, headers: header);
    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return (jsonResponse as List).map((e) => listing.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
