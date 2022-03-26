import 'dart:convert';
import 'package:bunny/models/addcoelho_model.dart';
import 'package:bunny/models/listing_model.dart';
import 'package:bunny/repositories/delete_coelho/delete_coelho_repository.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bunny/api/api_util.dart';
import 'package:bunny/api/endpoint.dart';
import 'package:bunny/services/dio_service.dart';
import 'package:http/http.dart' as http;

class DeleteCoelhoRepositoryImp implements DeleteCoelhoRepository {
  final DioService _dioservice;

  DeleteCoelhoRepositoryImp(this._dioservice);

  @override
  Future<listing?> deletecoelho(String id) async {
    var readToken = await PrefService.token_read();
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + readToken.toString()
    };
    var url =
        Uri.parse(Endpoint().api2 + API.DELETE_COELHO + '/${id.toString()}');
    var response = await http.delete(url, headers: header);
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return listing();
    } else {
      return null;
    }
  }
}


/*  Future<AddCoelho?> deletecoelho(String id) async {
    var readToken = await PrefService.token_read();

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + readToken.toString()
    };

    var url =
        Uri.parse(Endpoint().api2 + API.DELETE_COELHO + '/${id.toString()}');
    var response = await http.delete(url, headers: header);
    if (response.statusCode == 200) {
      return AddCoelho.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  

  )*/