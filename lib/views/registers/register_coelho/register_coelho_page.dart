import 'package:bunny/views/registers/register_coelho/widgets/custom_register_coelho.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class register_coelho extends StatelessWidget {
  const register_coelho({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          width: MediaQuery.of(context).size.width - 0,
          height: MediaQuery.of(context).size.height - 25,
          child: custom_register_coelho(),
        );
      },
    );
  }
}
