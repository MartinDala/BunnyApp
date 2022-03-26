import 'package:bunny/controllers/coelho_controller.dart';
import 'package:bunny/controllers/user_controller.dart';
import 'package:bunny/routes/app_page.dart';
import 'package:bunny/views/homepage/home_page.dart';
import 'package:bunny/widgets/custom_snak.dart';
import 'package:flutter/material.dart';

class CustomRegisterCoelhoButtonComponents extends StatelessWidget {
  final String texto;
  final double altura, largura;
  final Color Corbotao;
  final CoelhoController registerController;
  const CustomRegisterCoelhoButtonComponents(
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
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: altura,
                width: largura,
                child: ElevatedButton(
                    onPressed: () {
                      registerController
                          .create_users()
                          .then((result) => (result)
                              ? /* Get.off(Routes.Home)*/
                              MySnackbar.show(context, 'Registrado com sucesso')
                              : MySnackbar.show(context, 'Erro ao registrar'));
                      //  print("failed");
                    },
                    style: ElevatedButton.styleFrom(primary: Corbotao),
                    child: Text(texto)),
              ));
  }
}
