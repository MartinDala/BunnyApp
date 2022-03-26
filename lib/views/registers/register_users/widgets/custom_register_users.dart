import 'package:bunny/components/register_user/custom_button_register.dart';
import 'package:bunny/controllers/user_controller.dart';
import 'package:bunny/repositories/register_user/registeruser_repository_imp.dart';
import 'package:bunny/services/dio_service_imp.dart';
import 'package:bunny/util/colors.dart';
import 'package:bunny/views/login/widgets/custom_forms.dart';
import 'package:bunny/views/registers/register_users/widgets/custom_footterForLogin.dart';

import 'package:bunny/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class custom_register_users extends StatefulWidget {
  const custom_register_users({Key? key}) : super(key: key);

  @override
  _custom_register_usersState createState() => _custom_register_usersState();
}

class _custom_register_usersState extends State<custom_register_users> {
  @override
  UserController _controller =
      UserController(UserRepositoryImp(DioServiceImp()));
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Arasa",
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 140,
        actions: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/retangle.png"),
                    fit: BoxFit.cover,
                    scale: 880)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Criar Conta",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3E4958)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Por favor, preencha todos campos para criar sua conta Rabbity.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3E4958)),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Usuario",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3E4958)),
                ),
              ),
              Forms(
                  icone: Icons.verified_user,
                  texto: "Nome de Usuario",
                  onChanged: _controller.setNome),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Senha",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3E4958)),
                ),
              ),
              Forms(
                icone: Icons.password,
                texto: "Palavra Passe",
                onChanged: _controller.setSenha,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "E-mail",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3E4958)),
                ),
              ),
              Forms(
                  icone: Icons.email,
                  texto: "E-mail",
                  onChanged: _controller.setEmail),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Telefone",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3E4958)),
                ),
              ),
              Forms(
                  icone: Icons.phone_rounded,
                  texto: "Telefone",
                  onChanged: _controller.setContacto),
              SizedBox(height: 20),
              CustomRegisterButtonComponents(
                  altura: 50,
                  Corbotao: azulCarregado,
                  largura: MediaQuery.of(context).size.width - 0,
                  texto: "Criar Conta",
                  registerController: _controller),
              footterForLogin()
            ],
          ),
        ),
      ),
    );
  }
}

/* 
              */