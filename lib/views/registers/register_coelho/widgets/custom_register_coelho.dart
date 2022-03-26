import 'package:bunny/components/register_coelho/custom_coelho_button_register.dart';
import 'package:bunny/controllers/coelho_controller.dart';
import 'package:bunny/repositories/register_coelho/register_coelho_repository_imp.dart';
import 'package:bunny/services/dio_service_imp.dart';
import 'package:bunny/util/colors.dart';
import 'package:bunny/views/login/widgets/custom_forms.dart';
import 'package:bunny/views/registers/register_coelho/widgets/custom_campo_entrada.dart';
import 'package:bunny/views/registers/register_coelho/widgets/custom_form_date.dart';
import 'package:bunny/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class custom_register_coelho extends StatefulWidget {
  const custom_register_coelho({Key? key}) : super(key: key);

  @override
  State<custom_register_coelho> createState() => _custom_register_coelhoState();
}

class _custom_register_coelhoState extends State<custom_register_coelho> {
  @override
  String servico = "Macho/adulto";
  String dropdownSexo = 'm';
  String dropdownStatus = 'Activo';
  String dropdownTipoSangueno = 'A';
  DateTime? dateTime;
  CoelhoController _controller =
      CoelhoController(CoelhoRepositoryImp(DioServiceImp()));

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
            "Cadastrar Coelho",
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
                    "Nome do Coelho",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                Forms(
                    icone: Icons.people_alt,
                    texto: "Nome do Coelho",
                    onChanged: _controller.setNome),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Sexo",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0XFFE8F9FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownSexo,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownSexo = newValue!;
                            _controller.setSexo(newValue);
                          });
                        },
                        items: <String>['m', 'f']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Cor",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                Forms(
                  icone: Icons.color_lens,
                  texto: "Cor",
                  onChanged: _controller.setCor,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Data de Nascimento",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                Container(
                  //forms de entrada
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0XFFE8F9FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0XFFE8F9FF), width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0XFFE8F9FF), width: 1.0),
                        ),
                        hintText: dateTime == null
                            ? 'Selecione a data'
                            : DateFormat('yyyy/MM/dd').format(dateTime!),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.date_range_outlined),
                            onPressed: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate:
                                          DateTime(DateTime.now().year - 5),
                                      //DateTime(2001),
                                      lastDate:
                                          DateTime(DateTime.now().year + 5)
                                      /*DateTime(2023)*/

                                      )
                                  .then((date) {
                                setState(() {
                                  dateTime = date;
                                  _controller.setNascimento(
                                      DateFormat('yyyy-MM-dd')
                                          .format(dateTime!));
                                });
                              });
                            }),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Ninhada",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                Forms(
                  icone: Icons.list_alt_outlined,
                  texto: "Ninhada",
                  onChanged: _controller.setNinhada,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Raça",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                Forms(
                  icone: Icons.animation_outlined,
                  texto: "Raça",
                  onChanged: _controller.setRaca,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Status",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0XFFE8F9FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownStatus,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownStatus = newValue!;
                            _controller.setStatus(newValue);
                          });
                        },
                        items: <String>['Activo', 'Abatido', 'Vendido', 'Morto']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Pai",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                Forms(
                  icone: Icons.people_alt,
                  texto: "Pai",
                  onChanged: _controller.setPai,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Mãe",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                Forms(
                  icone: Icons.pregnant_woman,
                  texto: "Mãe",
                  onChanged: _controller.setMae,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tipo Sangueneo",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0XFFE8F9FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownTipoSangueno,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownTipoSangueno = newValue!;
                            _controller.setTipoSanguineo(newValue);
                          });
                        },
                        items: <String>['A', 'B', 'AB', 'O']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CustomRegisterCoelhoButtonComponents(
                      altura: 50,
                      Corbotao: azulCarregado,
                      largura: MediaQuery.of(context).size.width - 0,
                      texto: "Cadastrar Coelho",
                      registerController: _controller),
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