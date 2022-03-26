import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:bunny/api/api_util.dart';
import 'package:bunny/api/endpoint.dart';
import 'package:bunny/models/user_model.dart';
import 'package:bunny/repositories/register_user/registeruser_repository.dart';
import 'package:bunny/services/dio_service.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImp implements UserRepository {
  final DioService _dioservice;

  UserRepositoryImp(this._dioservice);

  @override
  Future<UserModel?> createuser(
      String nome,
      String contacto,
      String email,
      String senha,
      String tipo_usuario,
      String ano_nascimento,
      String sexo) async {
    final data = {
      "nome": nome,
      "telefone": contacto,
      "email": email,
      "senha": senha,
      "tipo_usuario": tipo_usuario,
      "ano_nascimento": ano_nascimento,
      "sexo": sexo
    };

    var url = Uri.parse(Endpoint().api + API.REGISTER_USER);
    var response = await http.post(url, body: data);

    if (response.statusCode == 200) {
      print("Registrado com sucesso");
      return UserModel(
          nome: nome,
          telefone: contacto,
          email: email,
          senha: senha,
          tipoUsuario: tipo_usuario,
          anoNascimento: ano_nascimento,
          sexo: sexo);
    } else {
      print("Debug:" + response.body);
      return null;
    }
  }
}




/*

,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }

 final data = jsonEncode(<String, String>{
      "nome": "nomeasasas",
      "contacto": "9118254292",
      "email": "malinadala@gmail.com",
      "senha": "abola",
      "tipo_usuario": "tiposusuario",
      "ano_nascimento": "2006",
      "sexo": "f"
    });


 final data = {
      "nome": user.nome,
      "contacto": user.contacto,
      "email": user.email,
      "senha": user.senha,
      "tipo_usuario": user.tipoUsuario,
      "ano_nascimento": user.anoNascimento,
      "sexo": user.sexo
    };
Future<Album> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

Future postData() async {
  var client = http.Client();
  try {
    var response = await client.post(
        Uri.parse('https://bunnyapp.000webhostapp.com/api/cadastrarUsuario'),
        body: {
          "nome": "InesFonsec",
          "contacto": "924466053",
          "email": "maslinadala@gmail.com",
          "senha": "viva2020",
          "tipo_usuario": "usuario",
          "ano_nascimento": "2003",
          "sexo": "m"
        });

    if (response.statusCode == 200) {
      print("Registrado com sucesso");
      //Navigator.of(context).pushNamed('/home');
      //Get.toNamed(Routes.Home);
    } else {
      return print("Não registrou nada");
    }
  } finally {
    client.close();
  }
}
*/