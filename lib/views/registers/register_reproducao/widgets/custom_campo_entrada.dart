import 'package:flutter/material.dart';

class CampoEntrada extends StatelessWidget {
  final IconData icone;
  final String texto;
  final Color corTexto;
  final Color corIcone;

  const CampoEntrada({
    Key? key,
    required this.icone,
    required this.texto,
    required this.corTexto,
    required this.corIcone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //forms de entrada
      width: MediaQuery.of(context).size.width - 32,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        child: TextFormField(
          // ignore: unnecessary_new
          decoration: new InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
            hintText: texto,
            hintStyle: TextStyle(color: corTexto),
            suffixIcon: Icon(
              icone,
              color: corIcone,
            ),
          ),
        ),
      ),
    );
  }
}
