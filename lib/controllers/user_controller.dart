import 'dart:convert';

import 'package:bunny/models/user_model.dart';
import 'package:bunny/repositories/register_user/registeruser_repository.dart';
import 'package:http/http.dart' as http;
import 'package:bunny/models/login_model.dart';
import 'package:bunny/routes/app_page.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:flutter/material.dart';

class UserController {
//para por older progress ao entrar
  final UserRepository _userRepository;

  UserController(this._userRepository);
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController senhacontroller = TextEditingController();
  String? _nome;
  String? _contacto;
  String? _email;
  String? _senha;
  String? _tipousuario = "usuario";
  String? _anonascimento = "1997-09-27";
  String? _sexo = "m";
  setNome(String value) => _nome = value;
  setContacto(String value) => _contacto = value;

  setEmail(String value) => _email = value;
  setSenha(String value) => _senha = value;

  setTipoUsuario(String value) => _tipousuario = value;
  setNascimento(String value) => _anonascimento = value;
  seSexo(String value) => _sexo = value;

  Future<bool> create_users() async {
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 2));
    inLoader.value = false;

    UserModel? user = await _userRepository.createuser(
        _nome.toString(),
        _contacto.toString(),
        _email.toString(),
        _senha.toString(),
        _tipousuario.toString(),
        _anonascimento.toString(),
        _sexo.toString());
    if (user != null) {
      // PrefService.save(_login.toString());
      print("CONTA CRIADA CONTROLLER");
      // print(user.token.toString());

      return true;
    } else {
      print("Erro");

      return false;
    }
  }
}
