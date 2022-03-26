import 'dart:convert';

import 'package:bunny/models/addcoelho_model.dart';
import 'package:bunny/models/listing_model.dart';
import 'package:bunny/repositories/delete_coelho/delete_coelho_repository.dart';
import 'package:bunny/views/listing/listing_page.dart';
import 'package:http/http.dart' as http;
import 'package:bunny/routes/app_page.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:flutter/material.dart';

class DeleteCoelhoController {
//para por older progress ao entrar

  final DeleteCoelhoRepository _deletecoelhoRepository;

  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  DeleteCoelhoController(this._deletecoelhoRepository);

  Future<bool> deletecoelho(String id) async {
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 2));
    inLoader.value = false;

    listing? user = await _deletecoelhoRepository.deletecoelho(id);

    if (user != null) {
      print("COELHO ALTERADO COM SUCESSO CONTROLLER");

      return true;
    } else {
      print("Erro");

      return false;
    }
  }
}
