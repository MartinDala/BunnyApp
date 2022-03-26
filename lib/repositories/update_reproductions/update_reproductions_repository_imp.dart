import 'dart:convert';

import 'package:bunny/models/addcoelho_model.dart';
import 'package:bunny/models/listing_reproductions_model.dart';
import 'package:bunny/repositories/update_reproductions/update_reproductions_repository.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bunny/api/api_util.dart';
import 'package:bunny/api/endpoint.dart';
import 'package:bunny/repositories/register_user/registeruser_repository.dart';
import 'package:bunny/services/dio_service.dart';
import 'package:http/http.dart' as http;

class UpdateReproductionsRepositoryImp
    implements UpdateReproductionsRepository {
  final DioService _dioservice;

  UpdateReproductionsRepositoryImp(this._dioservice);

  @override
  Future<listingreproduction?> updatereproduction(
      String nome_pai,
      String nome_mae,
      String DataColocarNinho,
      String DataDesmame,
      String DataProximoCruzamento,
      String DataRemoverNinho,
      String DataNascimento,
      String id,
      String IdUser) async {
    var readToken = await PrefService.token_read();

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + readToken.toString()
    };

    final data = jsonEncode({
      "nome_pai": nome_pai,
      "nome_mae": nome_mae,
      "DataDesmame": DataDesmame,
      "DataProximoCruzamento": DataProximoCruzamento,
      "DataRemoverNinho": DataRemoverNinho,
      "DataNascimento": DataNascimento
    });

    var url =
        Uri.parse(Endpoint().api + API.UPDATE_COELHO + "/${IdUser}/${id}");
    var response = await http.put(url, headers: header, body: data);

    if (response.statusCode == 200) {
      return listingreproduction(
          nomePai: nome_pai,
          nomeMae: nome_mae,
          dataDesmame: DataDesmame,
          dataProximoCruzamento: DataProximoCruzamento,
          dataRemoverNinho: DataRemoverNinho,
          dataNascimento: DataNascimento);
    } else {
      print(response.body);
      print(response.statusCode);
      return null;
    }
  }
}
