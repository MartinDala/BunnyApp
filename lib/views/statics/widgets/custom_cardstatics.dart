import 'dart:ui';

import 'package:bunny/util/colors.dart';
import 'package:flutter/material.dart';

class CardStatics extends StatelessWidget {
  final String texto;
  final String description;
  const CardStatics({Key? key, required this.texto, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        decoration: BoxDecoration(
            color: Color(0xFFF4F7FF), borderRadius: BorderRadius.circular(20)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(children: [
            Image.asset("assets/images/ratinho.png", width: 55),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      texto,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(description, style: TextStyle(color: azulCarregado))
                  ]),
            ),
          ])
        ]),
      ),
    );
  }
}
