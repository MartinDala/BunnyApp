import 'dart:convert';

import 'package:bunny/api/api_util.dart';
import 'package:bunny/api/endpoint.dart';
import 'package:bunny/models/login_model.dart';
import 'package:bunny/services/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_repository.dart';
import 'package:http/http.dart' as http;

class LoginRepositoryImp implements LoginRepository {
  final DioService _dioservice;
  LoginRepositoryImp(this._dioservice);

  @override
  Future<LoginModel> login(String email, String password) async {
    final data = {"email": email, "senha": password};
    var url = Uri.parse(Endpoint().api + API.LOGIN);
    var response = await http.post(url, body: data);

    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      SharedPreferences storage = await SharedPreferences.getInstance();
      await storage.setString('TOKEN', jsonResponse['token']);
      await storage.setString('EMAIL', jsonResponse['usuario']['email']);
      await storage.setString('NOME', jsonResponse['usuario']['nome']);
      await storage.setString('ID', jsonResponse['usuario']['id'].toString());
      return LoginModel(email: email, token: jsonResponse['token']);
    } else {
      return LoginModel(email: '', token: '');
    }
  }
}
