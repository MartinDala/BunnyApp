import 'package:bunny/components/register_coelho/custom_coelho_button_register.dart';
import 'package:bunny/components/register_reproduction/custom_coelho_button_register.dart';
import 'package:bunny/controllers/coelho_controller.dart';
import 'package:bunny/controllers/reproduction_controller.dart';
import 'package:bunny/repositories/register_coelho/register_coelho_repository_imp.dart';
import 'package:bunny/repositories/register_reproduction/register_reproduction_repository_imp.dart';
import 'package:bunny/services/dio_service_imp.dart';
import 'package:bunny/util/colors.dart';
import 'package:bunny/views/login/widgets/custom_forms.dart';
import 'package:bunny/views/registers/register_coelho/widgets/custom_campo_entrada.dart';
import 'package:bunny/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class custom_register_reproducao extends StatefulWidget {
  const custom_register_reproducao({Key? key}) : super(key: key);

  @override
  State<custom_register_reproducao> createState() =>
      _custom_register_reproducaoState();
}

class _custom_register_reproducaoState
    extends State<custom_register_reproducao> {
  @override
  String servico = "Macho/adulto";
  String dropdownValue = 'Masculino';

  ReproductionController _controller =
      ReproductionController(ReproductionRepositoryImp(DioServiceImp()));

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Cadastrar Reprodução",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Id do Pai",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                Forms(
                    icone: Icons.verified_user,
                    texto: "Id do Pai",
                    onChanged: _controller.setPai),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Id da Mãe",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                Forms(
                  icone: Icons.password,
                  texto: "Id da Mãe",
                  onChanged: _controller.setMae,
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CustomRegisterReproductionsButtonComponents(
                      altura: 50,
                      Corbotao: azulCarregado,
                      largura: MediaQuery.of(context).size.width - 0,
                      texto: "Cadastrar Reproducação",
                      reproductionsController: _controller),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
 Botao(
                rota: "Routes.AddCoelho",
                altura: 40,
                Corbotao: Colors.blue,
                largura: 180,
                texto: "Cadastrar")
                
                
                
                
                
                
                
                
                
                
                
                
                 DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Masculino', 'Femenino']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                
                
           */