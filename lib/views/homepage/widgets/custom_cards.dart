import 'package:bunny/util/colors.dart';
import 'package:flutter/material.dart';

class cards extends StatelessWidget {
  final String texto;
  final String description;
  final Color corIcone;
  final IconData? icone_;
  const cards(
      {Key? key,
      required this.corIcone,
      required this.texto,
      required this.description,
      required this.icone_})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 90,
          decoration: BoxDecoration(
              color: Color(0xFFF4F7FF),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF5C8AFF),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            icone_,
                            size: 30,
                            color: corIcone,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                texto,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(description)
                            ]),
                      ),
                    ])
                  ]),
            )),
          )),
    );
  }
}
