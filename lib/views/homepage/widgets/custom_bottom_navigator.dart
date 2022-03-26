import 'package:bunny/routes/app_page.dart';
import 'package:flutter/material.dart';

class custom_bottom_navigator extends StatefulWidget {
  const custom_bottom_navigator({
    Key? key,
  }) : super(key: key);

  @override
  _custom_bottom_navigatorState createState() =>
      _custom_bottom_navigatorState();
}

class _custom_bottom_navigatorState extends State<custom_bottom_navigator> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.white,
        onTap: (pos) {
          if (pos == 0) {
            setState(() {
              _selectedIndex = pos;
              //  Get.toNamed(Routes.Home);
            });
          } else {
            if (pos == 1) {
              setState(() {
                _selectedIndex = pos;
                //   Get.toNamed(Routes.AddCoelho);
              });
            } else {
              if (pos == 2) {
                setState(() {
                  _selectedIndex = pos;
                  print(_selectedIndex);
                });
              } else {
                setState(() {
                  _selectedIndex = pos;
                });
              }
            }
          }
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Inicio",
              backgroundColor: Colors.brown),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add Coelho",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Historico",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Stock",
          ),
        ]);
  }
}
