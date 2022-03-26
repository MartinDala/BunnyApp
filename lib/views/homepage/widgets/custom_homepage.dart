import 'package:bunny/routes/app_page.dart';
import 'package:bunny/views/homepage/widgets/custom_appbar.dart';
import 'package:bunny/views/homepage/widgets/custom_cards.dart';
import 'package:bunny/views/homepage/widgets/custom_icone.dart';
import 'package:flutter/material.dart';

class Custom_homepage extends StatelessWidget {
  const Custom_homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                width: 382.84,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/gestao.png"),
                        fit: BoxFit.cover,
                        scale: 880))),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              "Gerencie sua coelhada",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/addcoelho');
                  //   Get.toNamed(Routes.AddCoelho);
                },
                child: cards(
                  corIcone: Colors.white,
                  texto: 'Cadastrar',
                  icone_: Icons.add,
                  description: "cadastre seus coelhos",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/listing');
                  //   Get.toNamed(Routes.AddCoelho);
                },
                child: cards(
                  corIcone: Colors.white,
                  texto: 'Listagem',
                  icone_: Icons.list,
                  description: "consulte toda sua coelhada",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/reproducao');
                  //   Get.toNamed(Routes.AddCoelho);
                },
                child: cards(
                  corIcone: Colors.white,
                  texto: 'Reprodução',
                  icone_: Icons.list,
                  description: "Cadastro de reproduções",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/reproductionslisting_page');
                  //   Get.toNamed(Routes.AddCoelho);
                },
                child: cards(
                  corIcone: Colors.white,
                  texto: 'Ninhadas',
                  icone_: Icons.list,
                  description: "Listagem das reproduções",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/statics_page');
                  //   Get.toNamed(Routes.AddCoelho);
                },
                child: cards(
                  corIcone: Colors.white,
                  texto: 'Estatisticas',
                  icone_: Icons.list,
                  description: "estatistica da sua coelhada",
                ),
              ),
              cards(
                corIcone: Colors.white,
                texto: 'Medicação',
                icone_: Icons.health_and_safety,
                description: "Em desenvolvimento",
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
