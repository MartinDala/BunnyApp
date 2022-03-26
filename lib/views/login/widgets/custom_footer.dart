import 'package:bunny/routes/app_page.dart';
import 'package:bunny/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class footter extends StatelessWidget {
  const footter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          "Não tens uma conta?",
          style: TextStyle(color: azulCarregado),
        ),
        SizedBox(width: 5),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/addusers');
              //  Get.toNamed(Routes.AddUsers);
            },
            child: Text(
              "Regista-te?",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
