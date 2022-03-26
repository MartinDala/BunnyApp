import 'package:bunny/controllers/coelho_controller.dart';
import 'package:bunny/controllers/reproduction_controller.dart';
import 'package:bunny/controllers/user_controller.dart';
import 'package:bunny/routes/app_page.dart';
import 'package:bunny/views/homepage/home_page.dart';
import 'package:bunny/widgets/custom_snak.dart';
import 'package:flutter/material.dart';

class CustomRegisterReproductionsButtonComponents extends StatelessWidget {
  final String texto;
  final double altura, largura;
  final Color Corbotao;
  final ReproductionController reproductionsController;

  const CustomRegisterReproductionsButtonComponents(
      {Key? key,
      required this.reproductionsController,
      required this.texto,
      required this.altura,
      required this.largura,
      required this.Corbotao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: reproductionsController.inLoader,
        builder: (_, inLoader, __) => inLoader == true
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: altura,
                width: largura,
                child: ElevatedButton(
                    onPressed: () {
                      reproductionsController
                          .create_reproductions()
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
