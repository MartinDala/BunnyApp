import 'package:bunny/models/addcoelho_model.dart';
import 'package:bunny/repositories/register_coelho/register_coelho_repository.dart';
import 'package:bunny/repositories/register_user/registeruser_repository.dart';
import 'package:http/http.dart' as http;
import 'package:bunny/routes/app_page.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoelhoController {
//para por older progress ao entrar

  final CoelhoRepository _coelhoRepository;

  CoelhoController(this._coelhoRepository);

  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _nome;
  String? _sexo;
  String? _cor;
  String? _adicionadoPor = "2";

  String? _data_nascimento;
  String? _ninhada;
  String? _raca;
  String? _status;
  String? _pai;
  String? _mae;
  String? _tipo_sangueneo;
  setSexo(String value) => _sexo = value;
  setNome(String value) => _nome = value;
  setCor(String value) => _cor = value;
  setAdicionarPor(String value) => _adicionadoPor = value;
  setNascimento(String value) => _data_nascimento = value;
  setNinhada(String value) => _ninhada = value;
  setRaca(String value) => _raca = value;
  setStatus(String value) => _status = value;
  setPai(String value) => _pai = value;
  setMae(String value) => _mae = value;
  setTipoSanguineo(String value) => _tipo_sangueneo = value;

  Future<bool> create_users() async {
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 2));
    inLoader.value = false;
    var adicionadoPorId = await PrefService.getIdUser('ID');

    AddCoelho? user = await _coelhoRepository.createcoelho(
      _sexo.toString(),
      _nome.toString(),
      _cor.toString(),
      adicionadoPorId,
      _data_nascimento.toString(),
      _ninhada.toString(),
      _raca.toString(),
      _status.toString(),
      _pai.toString(),
      _mae.toString(),
      _tipo_sangueneo.toString(),
    );

    if (user != null) {
      // PrefService.save(_login.toString());
      print("COELHO CADASTRADO COM SUCESSO CONTROLLER");

      return true;
    } else {
      print("Erro");
      print("ID DO USUARIO: " + adicionadoPorId);

      return false;
    }
  }
}
