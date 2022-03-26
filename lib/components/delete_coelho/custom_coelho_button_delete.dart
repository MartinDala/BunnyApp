import 'package:bunny/controllers/delete_coelho_controller.dart';
import 'package:bunny/controllers/user_controller.dart';
import 'package:bunny/routes/app_page.dart';
import 'package:bunny/util/colors.dart';
import 'package:bunny/views/homepage/home_page.dart';
import 'package:bunny/widgets/custom_snak.dart';
import 'package:flutter/material.dart';

class CustomDeleteCoelhoButtonComponents extends StatelessWidget {
  final String texto;
  final String id;
  final double altura, largura;
  final Color Corbotao;
  final DeleteCoelhoController deleteController;
  const CustomDeleteCoelhoButtonComponents({
    Key? key,
    required this.deleteController,
    required this.texto,
    required this.altura,
    required this.largura,
    required this.id,
    required this.Corbotao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        deleteController.deletecoelho(id).then((result) => (result)
            ? /* Get.off(Routes.Home)*/

            MySnackbar.show(context, 'Eliminado com sucesso')
            : MySnackbar.show(context, 'Erro ao eliminar'));
        //  print("failed");

        // Navigator.of(context).pushReplacementNamed('/listing');
      },
      icon: Icon(
        Icons.delete,
        color: azulCarregado,
      ),
    );
  }
}
