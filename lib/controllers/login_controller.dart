import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bunny/models/login_model.dart';
import 'package:bunny/repositories/login_repository/login_repository.dart';
import 'package:bunny/routes/app_page.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:flutter/material.dart';

class LoginController {
//para por older progress ao entrar
  final LoginRepository _loginRepository;

  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController senhacontroller = TextEditingController();
  String? _login;

  LoginController(this._loginRepository);

  setLogin(String value) => _login = value;

  String? _pass;

  setPass(String value) => _pass = value;

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 2));

    LoginModel user =
        await _loginRepository.login(_login.toString(), _pass.toString());
    if (user.token != "") {
      PrefService.save(_login.toString());
      PrefService.save(user.token.toString());
      print("FEITTTO NO CONTROLLER");
      print(user.token.toString());

      return true;
    } else {
      print("Erro");
      inLoader.value = false;
      return false;
    }
  }
}
