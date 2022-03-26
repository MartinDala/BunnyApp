import 'package:bunny/views/homepage/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class Icone extends StatelessWidget {
  const Icone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 65,
          margin: EdgeInsets.only(left: 12, top: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
          ),
          child: Container(
              width: 100.00,
              height: 100.00,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: new DecorationImage(
                  image: NetworkImage(
                      "https://img.quizur.com/f/img60319118c53e52.98919042.jpg"),
                  fit: BoxFit.fitHeight,
                ),
              )),
        ),
      ],
    );
  }
}
