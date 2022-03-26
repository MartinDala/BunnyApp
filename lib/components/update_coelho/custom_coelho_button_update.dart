import 'package:bunny/controllers/update_coelho_controller.dart';
import 'package:bunny/controllers/user_controller.dart';
import 'package:bunny/routes/app_page.dart';
import 'package:bunny/views/homepage/home_page.dart';
import 'package:bunny/widgets/custom_snak.dart';
import 'package:flutter/material.dart';

class CustomUpdateCoelhoButtonComponents extends StatelessWidget {
  final String texto;
  final String id;
  final double altura, largura;
  final Color Corbotao;
  final UpdateCoelhoController updateController;
  const CustomUpdateCoelhoButtonComponents(
      {Key? key,
      required this.updateController,
      required this.texto,
      required this.altura,
      required this.largura,
      required this.id,
      required this.Corbotao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: updateController.inLoader,
        builder: (_, inLoader, __) => inLoader == true
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: altura,
                width: largura,
                child: ElevatedButton(
                    onPressed: () {
                      updateController
                          .updatecoelhos(id)
                          .then((result) => (result)
                              ? /* Get.off(Routes.Home)*/
                              MySnackbar.show(context, 'Alterado com sucesso')
                              : MySnackbar.show(context, 'Erro ao alterar'));
                      //  print("failed");
                    },
                    style: ElevatedButton.styleFrom(primary: Corbotao),
                    child: Text(texto)),
              ));
  }
}
