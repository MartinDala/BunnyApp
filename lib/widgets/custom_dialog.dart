import 'package:bunny/services/prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

LogoutAlertDialog(BuildContext context) {
  // set up the buttons

  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context)..pop();
    },
  );
  Widget sairButton = TextButton(
    child: Text("Sair"),
    onPressed: () {
      PrefService.logout();
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', ModalRoute.withName('/'));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Aviso"),
    content: Text("Tem certeza que deseja sair da aplicação?"),
    actions: [
      cancelButton,
      sairButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

SuccessCreateAccount(BuildContext context) {
  // set up the buttons

  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context)..pop();
    },
  );
  Widget sairButton = TextButton(
    child: Text("Login"),
    onPressed: () {
      PrefService.logout();
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', ModalRoute.withName('/'));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("🥰😍😜Que ótimo..."),
    content: Text("Sua Conta foi criada com sucesso"),
    actions: [
      cancelButton,
      sairButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

ErrorCreateAccount(BuildContext context) {
  // set up the buttons

  Widget cancelButton = TextButton(
    child: Text("Tentar"),
    onPressed: () {
      Navigator.of(context)..pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Ohh😪😪..."),
    content:
        Text("Erro ao criar sua conta, dè uma olhada se nos dados a preencher"),
    actions: [
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
