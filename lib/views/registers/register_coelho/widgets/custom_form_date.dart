import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormDate extends StatefulWidget {
  const FormDate({Key? key}) : super(key: key);

  @override
  _FormDateState createState() => _FormDateState();
}

class _FormDateState extends State<FormDate> {
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      //forms de entrada
      width: 350,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0XFFE8F9FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFFE8F9FF), width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFFE8F9FF), width: 1.0),
            ),
            hintText: dateTime == null
                ? 'Selecione a data'
                : DateFormat('yyyy/MM/dd').format(dateTime!),
            suffixIcon: IconButton(
                icon: Icon(Icons.date_range_outlined),
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 5),
                          //DateTime(2001),
                          lastDate: DateTime(DateTime.now().year + 5)
                          /*DateTime(2023)*/

                          )
                      .then((date) {
                    setState(() {
                      dateTime = date;
                    });
                  });
                }),
          ),
        ),
      ),
    );
  }
}
