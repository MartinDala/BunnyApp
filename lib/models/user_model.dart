import 'package:flutter/material.dart';

class UserModel {
  String? nome;
  String? telefone;
  String? email;
  String? senha;
  String? tipoUsuario;
  String? anoNascimento;
  String? sexo;

  UserModel(
      {this.nome,
      this.telefone,
      this.email,
      this.senha,
      this.tipoUsuario,
      this.anoNascimento,
      this.sexo});

  UserModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    telefone = json['telefone'];
    email = json['email'];
    senha = json['senha'];
    tipoUsuario = json['tipo_usuario'];
    anoNascimento = json['ano_nascimento'];
    sexo = json['sexo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['telefone'] = this.telefone;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['tipo_usuario'] = this.tipoUsuario;
    data['ano_nascimento'] = this.anoNascimento;
    data['sexo'] = this.sexo;
    return data;
  }
}
