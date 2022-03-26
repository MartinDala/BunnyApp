import 'dart:convert';

import 'package:bunny/models/addcoelho_model.dart';
import 'package:bunny/repositories/update_coelho/update_coelho_repository.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bunny/api/api_util.dart';
import 'package:bunny/api/endpoint.dart';
import 'package:bunny/repositories/register_user/registeruser_repository.dart';
import 'package:bunny/services/dio_service.dart';
import 'package:http/http.dart' as http;

class UpdateCoelhoRepositoryImp implements UpdateCoelhoRepository {
  final DioService _dioservice;

  UpdateCoelhoRepositoryImp(this._dioservice);

  @override
  Future<AddCoelho?> updatecoelho(
      String sexo,
      String nome,
      String cor,
      String adicionadoPor,
      String datanascimento,
      String status,
      String ninhada,
      String raca,
      String pai,
      String mae,
      String tiposangueneo,
      String id,
      String IdUser) async {
    var readToken = await PrefService.token_read();

    Map<String, String> header = {
      'Content-Type': 'application/json',
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

    var url =
        Uri.parse(Endpoint().api + API.UPDATE_COELHO + "/${IdUser}/${id}");
    var response = await http.put(url, headers: header, body: data);

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
      print(response.body);
      print(response.statusCode);
      return null;
    }
  }
}
