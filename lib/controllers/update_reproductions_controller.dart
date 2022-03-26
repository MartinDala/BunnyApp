import 'dart:convert';

import 'package:bunny/models/addcoelho_model.dart';
import 'package:bunny/models/listing_reproductions_model.dart';
import 'package:bunny/repositories/register_coelho/register_coelho_repository.dart';
import 'package:bunny/repositories/register_user/registeruser_repository.dart';
import 'package:bunny/repositories/update_coelho/update_coelho_repository.dart';
import 'package:bunny/repositories/update_reproductions/update_reproductions_repository.dart';
import 'package:http/http.dart' as http;
import 'package:bunny/routes/app_page.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:flutter/material.dart';

class UpdateReproductionsController {
//para por older progress ao entrar

  final UpdateReproductionsRepository _updatereproductionsRepository;

  UpdateReproductionsController(this._updatereproductionsRepository);
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);
  String? _nome_pai;
  String? _nome_mae;
  String? DataColocarNinho;
  String? DataDesmame;
  String? DataProximoCruzamento;
  String? DataRemoverNinho;
  String? DataNascimento;

  setPai(String value) => _nome_pai = value;
  setMae(String value) => _nome_mae = value;
  setDataColocarNinho(String value) => DataColocarNinho = value;
  setDataDesmame(String value) => DataDesmame = value;
  setDataProximoCruzamento(String value) => DataProximoCruzamento = value;
  setDataRemoverNinho(String value) => DataRemoverNinho = value;
  setDataNascimento(String value) => DataNascimento = value;
  Future<bool> updatecoelhos(String id) async {
    var adicionadoPorId = await PrefService.getIdUser('ID');
    inLoader.value = true;

    await Future.delayed(Duration(seconds: 2));
    inLoader.value = false;

    listingreproduction? user =
        await _updatereproductionsRepository.updatereproduction(
            _nome_pai.toString(),
            _nome_mae.toString(),
            DataColocarNinho.toString(),
            DataDesmame.toString(),
            DataProximoCruzamento.toString(),
            DataRemoverNinho.toString(),
            DataNascimento.toString(),
            id.toString(),
            adicionadoPorId.toString());

    if (user != null) {
      // PrefService.save(_login.toString());
      print("COELHO ALTERADO COM SUCESSO CONTROLLER");
      // print(user.token.toString());

      return true;
    } else {
      print("Erro");
      print(adicionadoPorId);
      return false;
    }
  }
}
