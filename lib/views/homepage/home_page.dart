import 'package:bunny/views/homepage/widgets/custom_appbar.dart';
import 'package:bunny/views/homepage/widgets/custom_bottom_navigator.dart';
import 'package:bunny/views/homepage/widgets/custom_homepage.dart';
import 'package:bunny/widgets/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
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
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 100,
          title: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Olá",
                  style: TextStyle(
                    fontSize: 19,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                "${nomes}",
                style: TextStyle(color: Color(0xFF000000), fontSize: 15),
              )
            ]),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.black)),
            PopupMenuButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onSelected: (newValue) {
                  // add this property
                  setState(() {
                    if (newValue == 2) {
                      LogoutAlertDialog(context);
                    }
                  });
                },
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      child: Text("Perfil"),
                      value: 0,
                    ),
                    const PopupMenuItem(
                      child: Text("Notificação"),
                      value: 1,
                    ),
                    const PopupMenuItem(
                      child: Text("Sair"),
                      value: 2,
                    ),
                  ];
                })
          ],
        ),
        body: Custom_homepage());
  }
}

/*
appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 100,

           bottom: PreferredSize(
            child: Container(

            )),
          actions: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text("Olá",
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(
                                "${nomes}",
                                style: TextStyle(
                                    color: Color(0xFF000000), fontSize: 15),
                              )
                            ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon:
                                      Icon(Icons.notifications_active_outlined),
                                  color: Colors.black,
                                ),
                                IconButton(
                                  onPressed: () {
                                    LogoutAlertDialog(context);
                                  },
                                  icon: Icon(
                                    Icons.logout_sharp,
                                    color: Colors.black,
                                  ),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),


        */


        /*appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          toolbarHeight: 100,
          title: Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text("Olá",
                    style: TextStyle(
                      fontSize: 19,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  "${nomes}",
                  style: TextStyle(color: Color(0xFF000000), fontSize: 15),
                )
              ])),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            PopupMenuButton(onSelected: (newValue) {
              // add this property
              setState(() {
                if (newValue == 2) {
                  LogoutAlertDialog(context);
                }
              });
            }, itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  child: Text("Perfil"),
                  value: 0,
                ),
                const PopupMenuItem(
                  child: Text("Notificação"),
                  value: 1,
                ),
                const PopupMenuItem(
                  child: Text("Sair"),
                  value: 2,
                ),
              ];
            })
          ],
          bottom: PreferredSize(
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text("Olá",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              "${nomes}",
                              style: TextStyle(
                                  color: Color(0xFF000000), fontSize: 15),
                            )
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.notifications_active_outlined),
                                color: Colors.black,
                              ),
                              IconButton(
                                onPressed: () {
                                  LogoutAlertDialog(context);
                                },
                                icon: Icon(
                                  Icons.logout_sharp,
                                  color: Colors.black,
                                ),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              )),
              preferredSize: const Size.fromHeight(60.0)),
        ),

        */