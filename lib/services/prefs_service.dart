import 'dart:convert';
import 'package:bunny/routes/app_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  static final String _key = 'key';

  static save(String user) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode({"user": user, "isAuth": true}));
  }

  static Future<bool> isAuth() async {
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(_key);

    if (jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);

      return mapUser['isAuth'];
    }

    return false;
  }

  static logout() async {
    var prefs = await SharedPreferences.getInstance();

    prefs.remove(_key);

    // Navigator.of(context).pushReplacementNamed('/home');
    // Get.offNamed(Routes.Login);
  }

  static token_read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'TOKEN';
    final read_value = prefs.getString(key) ?? 0;
    return read_value;
  }

  static id_read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'ID';
    final read_value = prefs.getString(key) ?? 0;
    return read_value;
  }

  static getIdUser(String dados) async {
    var prefs = await SharedPreferences.getInstance();

    final result = prefs.getString(dados);
    return result;
    // Navigator.of(context).pushReplacementNamed('/home');
    // Get.offNamed(Routes.Login);
  }

  static getEmail(String dados) async {
    var prefs = await SharedPreferences.getInstance();

    final result = prefs.getString(dados);
    return result;
    // Navigator.of(context).pushReplacementNamed('/home');
    // Get.offNamed(Routes.Login);
  }
}
