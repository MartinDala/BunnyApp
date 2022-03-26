import 'package:bunny/views/statics/widgets/custom_statics.dart';
import 'package:bunny/widgets/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class statics_page extends StatefulWidget {
  const statics_page({Key? key}) : super(key: key);

  @override
  _statics_pageState createState() => _statics_pageState();
}

class _statics_pageState extends State<statics_page> {
  String nomes = "";
  void verdados() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    setState(() {
      nomes = myPrefs.getString('NOME')!;
    });
  }

  @override
  void initState() {
    verdados();
    super.initState();
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Estatistica",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Custom_Statics(),
    );
  }
}
