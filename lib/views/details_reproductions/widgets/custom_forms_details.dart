import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormsDeitails extends StatelessWidget {
  final String texto;
  final Function(String) onChanged;
  final bool obscaureText;

  const FormsDeitails(
      {Key? key,
      required this.texto,
      required this.onChanged,
      this.obscaureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //forms de entrada
      width: 350,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: TextFormField(
            keyboardType: TextInputType.text,
            enabled: false,
            decoration: new InputDecoration(
              hintText: texto,
            ),
            onChanged: onChanged,
            obscureText: obscaureText,
          ),
        ),
      ),
    );
  }
}
