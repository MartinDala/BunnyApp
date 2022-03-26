import 'dart:convert';

import 'package:bunny/models/addcoelho_model.dart';
import 'package:bunny/repositories/register_coelho/register_coelho_repository.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bunny/api/api_util.dart';
import 'package:bunny/api/endpoint.dart';
import 'package:bunny/repositories/register_user/registeruser_repository.dart';
import 'package:bunny/services/dio_service.dart';
import 'package:http/http.dart' as http;

class CoelhoRepositoryImp implements CoelhoRepository {
  final DioService _dioservice;

  CoelhoRepositoryImp(this._dioservice);

  @override
  Future<AddCoelho?> createcoelho(
      String sexo,
      String nome,
      String cor,
      String adicionadoPor,
      String datanascimento,
      String ninhada,
      String raca,
      String status,
      String pai,
      String mae,
      String tiposangueneo) async {
    var readToken = await PrefService.token_read();

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + readToken.toString()
    };

    final data = jsonEncode({
      "sexo": sexo,
      "nome": nome,
      "cor": cor,
      "adicionado_por": adicionadoPor,
      "data_nascimento": datanascimento,
      "ninhada": ninhada,
      "raca": raca,
      "status": status,
      "pai_id": pai,
      "mae_id": mae,
      "tipo_sanguineo": tiposangueneo
    });

    var url = Uri.parse(Endpoint().api + API.REGISTER_COELHO);
    var response = await http.post(url, headers: header, body: data);

    if (response.statusCode == 200) {
      return AddCoelho(
          sexo: sexo,
          nome: nome,
          cor: cor,
          adicionadoPor: adicionadoPor,
          dataNascimento: datanascimento,
          ninhada: ninhada,
          raca: raca,
          status: status,
          paiId: pai,
          maeId: mae,
          tipoSanguineo: tiposangueneo);
    } else {
      print("CORPO: " + response.body);

      return null;
    }
  }
}
