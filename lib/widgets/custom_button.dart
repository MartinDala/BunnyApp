import 'package:bunny/routes/app_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  final double altura, largura;
  final Color Corbotao;
  final String rota;
  const Botao(
      {Key? key,
      required this.rota,
      required this.altura,
      required this.Corbotao,
      required this.largura,
      required this.texto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: altura,
      width: largura,
      child: ElevatedButton(
          onPressed: () {
            //  Get.toNamed(rota);
          },
          style: ElevatedButton.styleFrom(primary: Corbotao),
          child: Text(texto)),
    );
  }
}
