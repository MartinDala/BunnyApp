import 'package:bunny/components/delete_coelho/custom_coelho_button_delete.dart';

import 'package:bunny/repositories/listing_repository/listing_repository_imp.dart';
import 'package:bunny/services/dio_service_imp.dart';
import 'package:bunny/util/colors.dart';
import 'package:bunny/views/listing_reproductions/widgets/reprodutions.dart';
import 'package:bunny/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';

class ListingReproductions extends StatefulWidget {
  const ListingReproductions({Key? key}) : super(key: key);

  @override
  _ListingReproductionsState createState() => _ListingReproductionsState();
}

class _ListingReproductionsState extends State<ListingReproductions> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        // initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 90,
            title: Text(
              "Minhas Reproduções",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  color: Colors.black),
            ],
          ),
          body: reproductions(),
        ));
  }
}


/*ValueListenableBuilder<List<listing>?>(
          valueListenable: _controller.show,
          builder: (_, show, __) {
            return show != null
                ? ListView.builder(
                    itemCount: show.length,
                    itemBuilder: (_, idx) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          tileColor: azulOcean,
                          selectedTileColor: azulOcean,
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: azulClaro,
                            ),
                            child: Center(
                              child: Text("A1",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                          title: Text(show[idx].nome!),
                          subtitle: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Sexo: ${show[idx].sexo} '),
                              Text('Idade: ${show[idx].idade} '),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        '/updatecoelho',
                                        arguments: show[idx]);
                                  },
                                  icon: Icon(Icons.edit)),
                              CustomDeleteCoelhoButtonComponents(
                                altura: 50,
                                Corbotao: Colors.black,
                                largura: MediaQuery.of(context).size.width - 0,
                                texto: "Eliminar",
                                id: show[idx].id.toString(),
                                deleteController: _controllerdelete,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),*/