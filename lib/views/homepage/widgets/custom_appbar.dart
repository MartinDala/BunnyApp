import 'package:bunny/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class custom_appbar extends StatefulWidget {
  const custom_appbar({Key? key}) : super(key: key);

  @override
  _custom_appbarState createState() => _custom_appbarState();
}

class _custom_appbarState extends State<custom_appbar> {
  String nomes = "";
  void verdados() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    setState(() {
      nomes = myPrefs.getString('EMAIL')!;
    });
  }

  @override
  void initState() {
    verdados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      //columna de texto

      children: [
        Column(
          children: [
            Text(
              "Dasboards",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(
              height: 2,
            ),
            Text('Oi, ${nomes}', style: TextStyle(color: Colors.white)),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.call_rounded,
              color: Colors.white,
            ),
            SizedBox(width: 12),
            IconButton(
                onPressed: () {
                  LogoutAlertDialog(context);
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                ))
          ],
        ),
      ],
    );
  }
}


/* 

    */