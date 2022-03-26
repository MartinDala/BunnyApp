import 'dart:convert';

import 'package:bunny/components/login/custom_button_login.dart';
import 'package:bunny/controllers/login_controller.dart';
import 'package:bunny/models/login_model.dart';
import 'package:bunny/repositories/login_repository/login_repository_imp.dart';
import 'package:bunny/repositories/login_repository/login_repository.dart';
import 'package:bunny/routes/app_page.dart';
import 'package:bunny/services/dio_service_imp.dart';
import 'package:bunny/util/colors.dart';
import 'package:bunny/widgets/custom_button.dart';
import 'package:bunny/views/login/widgets/custom_footer.dart';
import 'package:bunny/views/login/widgets/custom_forms.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class custom_login extends StatefulWidget {
  const custom_login({Key? key}) : super(key: key);

  @override
  _custom_loginState createState() => _custom_loginState();
}

class _custom_loginState extends State<custom_login> {
  final LoginController _controller =
      LoginController(LoginRepositoryImp(DioServiceImp()));

  @override
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Login",
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
                    "Por favor, preencha e-mail e senha para entrar na sua conta Rabbity.",
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
                    "Email",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                Forms(
                  icone: Icons.verified_user,
                  texto: "Insira seu email",
                  onChanged: _controller.setLogin,
                ),
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
                  icone: Icons.password_outlined,
                  texto: "Insira sua senha",
                  onChanged: _controller.setPass,
                  obscaureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 210),
                  child: Text(
                    "Esqueceu a senha?",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Color(0xFF3E4958), fontSize: 14),
                  ),
                ),
                SizedBox(height: 20),
                CustomLoginButtonComponents(
                    altura: 55,
                    Corbotao: azulCarregado,
                    largura: double.infinity,
                    texto: "Entrar",
                    loginController: _controller),
              ],
            ),
          ),
          footter()
        ]),
      ),
    );

    /*
          TextFormField(
            // ignore: unnecessary_new
            keyboardType: TextInputType.text,
            decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal)),
              hintText: "texto",
              hintStyle: TextStyle(color: Colors.white),
            ),
            controller: emailcontroller,
            //onChanged: onChanged,
          ),
          TextFormField(
            // ignore: unnecessary_new
            keyboardType: TextInputType.text,
            decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal)),
              hintText: "texto",
              hintStyle: TextStyle(color: Colors.white),
            ),
            controller: senhacontroller,
            //onChanged: onChanged,
          ),
          ElevatedButton(
              onPressed: () {
                login();
              },
              child: Text("Login"))
        ],
      ),
    );
  }

*/

//TESTES DE FUNCIONALIDADES //
/*
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

  Future<void> login() async {
    var url = Uri.parse('https://bunnyapp.000webhostapp.com/api/login');
    var response = await http.post(url,
        body: {"email": emailcontroller.text, "senha": senhacontroller.text});
//email": "eve.holt@reqres.in", "password": "cityslicka"
//"email":"martindala@gmail.com","senha":"angola2020"
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print('Token User: ' + jsonResponse['token']);
      print('Nome: ' + jsonResponse['usuario']['nome']);

      print('Email: ' + jsonResponse['usuario']['email']);

      print('Sexo: ' + jsonResponse['usuario']['sexo']);

      print('Contacto: ' + jsonResponse['usuario']['contacto']);
      return print(jsonResponse['message'].toString());

      //Navigator.of(context).pushNamed('/home');
      //Get.toNamed(Routes.Home);
    } else {
      return print(jsonResponse['message'].toString());
    }
  }
}



*/

/*

   var url =
        Uri.parse('https://bunnyapp.000webhostapp.com//api/cadastrarUsuario');
    var response = await http.post(url, body: {
      'nome': 'Martin Daa',
      'contacto': '91182344',
      'email': 'otalaaasrmando@gmail.com',
      'senha': '123aa4',
      'tipo_usuario': 'usuaario',
      'ano_nascimento': '2003',
      'sexo': 'm'
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print("Registrado com sucesso");




    -----
  final String pathURL =
        "https://bunnyapp.000webhostapp.com//api/cadastrarUsuario";

    dynamic data = {
      'nome': 'Martin Daa',
      'contacto': '91182344',
      'email': 'otalaaasrmando@gmail.com',
      'senha': '123aa4',
      'tipo_usuario': 'usuaario',
      'ano_nascimento': '2003',
      'sexo': 'm'
    };
    var response = await Dio().post(
      pathURL,
      data: data,
      options: Options(method: "POST", headers: {
        'context-type': 'application/json; charset=utf-8',
      }),
    );

    return print("Cadastrado com sucesso");



    -------------------------
    if (emailcontroller.text.isNotEmpty && senhacontroller.text.isNotEmpty) {
      var result = await Dio().post(
          'https://bunnyapp.000webhostapp.com/api/login',
          options: Options(method: "POST", headers: {
            'context-type': 'application/json; charset=utf-8',
          }),
          data: {
            "email": emailcontroller.text,
            "password": senhacontroller.text
          });

      if (result.statusCode == 200) {
        return print("Logadoooo"); //Navigator.of(context).pushNamed('/home');
        //Get.toNamed(Routes.Home);
      } else {
        return print("Não logadoo");
      }
   
    }

  */
  }
}
