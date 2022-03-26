import 'package:bunny/components/update_coelho/custom_coelho_button_update.dart';
import 'package:bunny/controllers/update_coelho_controller.dart';
import 'package:bunny/models/addcoelho_model.dart';
import 'package:bunny/models/listing_model.dart';
import 'package:bunny/repositories/update_coelho/update_coelho_repository_imp.dart';
import 'package:bunny/services/dio_service_imp.dart';
import 'package:bunny/util/colors.dart';
import 'package:bunny/views/login/widgets/custom_forms.dart';
import 'package:flutter/material.dart';

class UpdateCoelho extends StatefulWidget {
  const UpdateCoelho({Key? key}) : super(key: key);

  @override
  _UpdateCoelhoState createState() => _UpdateCoelhoState();
}

class _UpdateCoelhoState extends State<UpdateCoelho> {
  @override
  UpdateCoelhoController _controller =
      UpdateCoelhoController(UpdateCoelhoRepositoryImp(DioServiceImp()));

  Widget build(BuildContext context) {
    listing args = ModalRoute.of(context)!.settings.arguments as listing;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Editar Coelho",
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
                    icone: Icons.verified_user,
                    texto: args.nome.toString(),
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
                Forms(
                  icone: Icons.password,
                  texto: args.sexo.toString(),
                  onChanged: _controller.setSexo,
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
                  icone: Icons.password,
                  texto: args.cor.toString(),
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
                Forms(
                  icone: Icons.password,
                  texto: args.dataNascimento.toString(),
                  onChanged: _controller.setNascimento,
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
                  icone: Icons.password,
                  texto: args.ninhada.toString(),
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
                  icone: Icons.password,
                  texto: args.raca.toString(),
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
                Forms(
                    icone: Icons.password,
                    texto: args.status.toString(),
                    onChanged: _controller.setStatus),
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
                  icone: Icons.password,
                  texto: args.paiId.toString(),
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
                  icone: Icons.password,
                  texto: args.maeId.toString(),
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
                Forms(
                  icone: Icons.password,
                  texto: args.tipoSanguineo.toString(),
                  onChanged: _controller.setTipoSanguineo,
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CustomUpdateCoelhoButtonComponents(
                      altura: 50,
                      Corbotao: azulCarregado,
                      largura: MediaQuery.of(context).size.width - 0,
                      texto: "Alterar",
                      id: args.id.toString(),
                      updateController: _controller),
                ),
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