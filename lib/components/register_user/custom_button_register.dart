import 'package:bunny/controllers/user_controller.dart';
import 'package:bunny/routes/app_page.dart';
import 'package:bunny/util/colors.dart';
import 'package:bunny/views/homepage/home_page.dart';
import 'package:bunny/widgets/custom_dialog.dart';
import 'package:bunny/widgets/custom_snak.dart';
import 'package:flutter/material.dart';

class CustomRegisterButtonComponents extends StatelessWidget {
  final String texto;
  final double altura, largura;
  final Color Corbotao;
  final UserController registerController;
  const CustomRegisterButtonComponents(
      {Key? key,
      required this.registerController,
      required this.texto,
      required this.altura,
      required this.largura,
      required this.Corbotao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: registerController.inLoader,
        builder: (_, inLoader, __) => inLoader == true
            ? Center(
                child: CircularProgressIndicator(
                color: azulCarregado,
              ))
            : Container(
                height: altura,
                width: largura,
                child: ElevatedButton(
                    onPressed: () {
                      registerController
                          .create_users()
                          .then((result) => (result)
                              ? /* Get.off(Routes.Home)*/
                              SuccessCreateAccount(context)
                              : ErrorCreateAccount(context));
                      //  print("failed");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Corbotao,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14), //
                      ),
                      shadowColor: azulClaro,
                    ),
                    child: Text(texto)),
              ));
  }
}
