import 'package:bunny/components/update_coelho/custom_coelho_button_update.dart';
import 'package:bunny/controllers/update_coelho_controller.dart';
import 'package:bunny/controllers/update_reproductions_controller.dart';
import 'package:bunny/models/addcoelho_model.dart';
import 'package:bunny/models/listing_model.dart';
import 'package:bunny/models/listing_reproductions_model.dart';
import 'package:bunny/models/reproduction_model.dart';
import 'package:bunny/repositories/update_coelho/update_coelho_repository_imp.dart';
import 'package:bunny/repositories/update_reproductions/update_reproductions_repository_imp.dart';
import 'package:bunny/services/dio_service_imp.dart';
import 'package:bunny/util/colors.dart';
import 'package:bunny/views/details_reproductions/widgets/custom_forms_details.dart';
import 'package:bunny/views/login/widgets/custom_forms.dart';
import 'package:flutter/material.dart';

class DetailReproductions extends StatefulWidget {
  const DetailReproductions({Key? key}) : super(key: key);

  @override
  _DetailReproductionsState createState() => _DetailReproductionsState();
}

class _DetailReproductionsState extends State<DetailReproductions> {
  @override
  UpdateReproductionsController _controller = UpdateReproductionsController(
      UpdateReproductionsRepositoryImp(DioServiceImp()));

  Widget build(BuildContext context) {
    listingreproduction args =
        ModalRoute.of(context)!.settings.arguments as listingreproduction;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Reproduções",
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
                    "Pai",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                FormsDeitails(
                    texto: args.nomePai.toString(),
                    onChanged: _controller.setPai),
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
                FormsDeitails(
                  texto: args.nomeMae.toString(),
                  onChanged: _controller.setMae,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Data de Colocar no Ninho",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                FormsDeitails(
                  texto: args.dataColocarNinho.toString(),
                  onChanged: _controller.setDataColocarNinho,
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
                FormsDeitails(
                  texto: args.dataNascimento.toString(),
                  onChanged: _controller.setDataNascimento,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Data de Desmame",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                FormsDeitails(
                  texto: args.dataDesmame.toString(),
                  onChanged: _controller.setDataDesmame,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Data Remover Ninho",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                FormsDeitails(
                  texto: args.dataRemoverNinho.toString(),
                  onChanged: _controller.setDataRemoverNinho,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Data do Proximo Cruzamento",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3E4958)),
                  ),
                ),
                FormsDeitails(
                  texto: args.dataProximoCruzamento.toString(),
                  onChanged: _controller.setDataProximoCruzamento,
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


    /*SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Column(children: [
          SizedBox(height: 120),
          Center(
            child: Text(
              "Editar Coelhos",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
//parte da lista
          SizedBox(height: 10),

          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 150),
                child: Column(
                  children: [
                    Forms(
                      icone: Icons.verified_user,
                      texto: args.nome.toString(),
                      onChanged: _controller.setNome,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Forms(
                      icone: Icons.password,
                      texto: args.sexo.toString(),
                      onChanged: _controller.setSexo,
                    ),
                    Forms(
                      icone: Icons.email,
                      texto: args.idade.toString(),
                      onChanged: _controller.setNascimento,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: CustomUpdateCoelhoButtonComponents(
                    altura: 50,
                    Corbotao: Colors.black,
                    largura: MediaQuery.of(context).size.width - 0,
                    texto: "Alterar",
                    id: args.id.toString(),
                    updateController: _controller),
              )
            ],
          ),
        ]),
      ),
    );

    ?*/