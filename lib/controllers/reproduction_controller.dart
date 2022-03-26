import 'package:bunny/models/addcoelho_model.dart';
import 'package:bunny/models/reproduction_model.dart';
import 'package:bunny/repositories/register_reproduction/register_reproduction_repository.dart';
import 'package:http/http.dart' as http;
import 'package:bunny/routes/app_page.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReproductionController {
//para por older progress ao entrar

  final ReproductionRepository _reproductionRepository;

  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _pai;
  String? _mae;
  String? _dataColocarNinho = "2022-07-07";
  String? _dataDesmame = "2022-07-07";
  String? _dataProximoCruzamento = "2022-07-07";
  String? _dataRemoverNinho = "2022-07-07";
  String? _dataNascimento = "2022-07-07";
  ReproductionController(this._reproductionRepository);
  setPai(String value) => _pai = value;
  setMae(String value) => _mae = value;

  setdataColocarNinho(String value) => _dataColocarNinho = value;
  setdataDesmame(String value) => _dataDesmame = value;
  setdataProximoCruzamento(String value) => _dataProximoCruzamento = value;
  setdataRemoverNinho(String value) => _dataRemoverNinho = value;

  Future<bool> create_reproductions() async {
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 2));
    inLoader.value = false;
    var adicionadoPorId = await PrefService.getIdUser('ID');

    reproduction? user = await _reproductionRepository.createReprodution(
        adicionadoPorId,
        _pai.toString(),
        _mae.toString(),
        _dataColocarNinho.toString(),
        _dataDesmame.toString(),
        _dataProximoCruzamento.toString(),
        _dataRemoverNinho.toString(),
        _dataNascimento.toString());

    if (user != null) {
      // PrefService.save(_login.toString());
      print("REPRODUÇÃO CADASTRADA COM SUCESSO CONTROLLER");
      print("ID DO USUARIO: " + adicionadoPorId);
      return true;
    } else {
      print("Erro");
      print("ID DO USUARIO: " + adicionadoPorId);

      return false;
    }
  }
}
