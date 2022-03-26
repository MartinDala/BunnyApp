import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forms extends StatelessWidget {
  final IconData icone;
  final String texto;
  final Function(String) onChanged;
  final bool obscaureText;

  const Forms(
      {Key? key,
      required this.icone,
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
              borderSide: BorderSide(color: Color(0XFFE8F9FF), width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFFE8F9FF), width: 1.0),
            ),
            hintText: texto,
            suffixIcon: Icon(
              icone,
              color: Color(0xFFBCCFFF),
            ),
          ),
          onChanged: onChanged,
          obscureText: obscaureText,
        ),
      ),
    );
  }
}
