import 'package:bunny/routes/app_page.dart';
import 'package:bunny/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class footterForLogin extends StatelessWidget {
  const footterForLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          "Já tem uma conta?",
          style: TextStyle(color: azulCarregado),
        ),
        SizedBox(width: 5),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/login');
              //  Get.toNamed(Routes.AddUsers);
            },
            child: Text(
              "Login",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
