import 'package:bunny/views/registers/register_users/widgets/custom_register_users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class register_users extends StatelessWidget {
  const register_users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width - 0,
              height: MediaQuery.of(context).size.height - 25,
              child: custom_register_users(),
            );
          },
        ),
      ),
    );
  }
}
