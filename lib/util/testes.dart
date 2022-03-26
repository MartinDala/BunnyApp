import 'package:flutter/material.dart';

class Testes extends StatefulWidget {
  const Testes({Key? key}) : super(key: key);

  @override
  _TestesState createState() => _TestesState();
}

class _TestesState extends State<Testes> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

/*
  
  Future<void> login() async {
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 2));
    inLoader.value = false;

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
}*/

}
