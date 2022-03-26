import 'dart:convert';
import 'package:bunny/models/reproduction_model.dart';
import 'package:bunny/repositories/register_reproduction/register_reproduction_repository.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bunny/api/api_util.dart';
import 'package:bunny/api/endpoint.dart';
import 'package:bunny/services/dio_service.dart';
import 'package:http/http.dart' as http;

class ReproductionRepositoryImp implements ReproductionRepository {
  final DioService _dioservice;

  ReproductionRepositoryImp(this._dioservice);

  @override
  Future<reproduction?> createReprodution(
      String iduser,
      String pai,
      String mae,
      String dataColocarNinho,
      String dataDesmame,
      String dataProximoCruzamento,
      String dataRemoverNinho,
      String dataNascimento) async {
    var readToken = await PrefService.token_read();

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + readToken.toString()
    };

    final data = jsonEncode({
      "nome_pai": pai,
      "nome_mae": mae,
      "DataNascimento": dataNascimento,
      "DataColocarNinho": dataColocarNinho,
      "DataDesmame": dataDesmame,
      "DataProximoCruzamento": dataProximoCruzamento,
      "DataRemoverNinho": dataRemoverNinho
    });

    var url =
        Uri.parse(Endpoint().api + API.REGISTER_REPRODUCTION + "/${iduser}");
    var response = await http.post(url, headers: header, body: data);

    if (response.statusCode == 200) {
      return reproduction(
          nomePai: pai,
          nomeMae: mae,
          dataColocarNinho: dataColocarNinho,
          dataDesmame: dataDesmame,
          dataProximoCruzamento: dataProximoCruzamento,
          dataRemoverNinho: dataRemoverNinho,
          dataNascimento: dataNascimento);
    } else {
      print("CORPO: " + response.body);

      return null;
    }
  }
}
