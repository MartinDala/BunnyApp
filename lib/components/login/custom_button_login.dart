import 'package:bunny/controllers/login_controller.dart';
import 'package:bunny/routes/app_page.dart';
import 'package:bunny/util/colors.dart';
import 'package:bunny/views/homepage/home_page.dart';
import 'package:bunny/widgets/custom_snak.dart';
import 'package:flutter/material.dart';

class CustomLoginButtonComponents extends StatelessWidget {
  final String texto;
  final double altura, largura;
  final Color Corbotao;
  final LoginController loginController;
  const CustomLoginButtonComponents(
      {Key? key,
      required this.loginController,
      required this.texto,
      required this.altura,
      required this.largura,
      required this.Corbotao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: loginController.inLoader,
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
                      loginController.auth().then((result) => (result)
                          ? /* Get.off(Routes.Home)*/
                          Navigator.of(context).pushReplacementNamed('/home')
                          : MySnackbar.show(
                              context, 'Utilizador não encontrado'));
                      //  print("failed");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Corbotao,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14), //
                      ),
                      shadowColor: azulClaro,
                    ),
                    child: Text(texto,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )))));
  }
}
