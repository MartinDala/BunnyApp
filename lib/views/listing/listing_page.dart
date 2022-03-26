import 'package:bunny/components/delete_coelho/custom_coelho_button_delete.dart';
import 'package:bunny/controllers/delete_coelho_controller.dart';
import 'package:bunny/controllers/listing_controller.dart';
import 'package:bunny/models/listing_model.dart';
import 'package:bunny/repositories/delete_coelho/delete_coelho_repository_imp.dart';
import 'package:bunny/repositories/listing_repository/listing_repository_imp.dart';
import 'package:bunny/services/dio_service_imp.dart';
import 'package:bunny/util/colors.dart';
import 'package:bunny/views/listing/widgets/tab1.dart';
import 'package:bunny/views/listing/widgets/tab_abatidos.dart';
import 'package:bunny/views/listing/widgets/tab_mortos.dart';
import 'package:bunny/views/listing/widgets/tab_vendidos.dart';
import 'package:bunny/views/login/widgets/custom_forms.dart';
import 'package:bunny/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';

class Listing extends StatefulWidget {
  const Listing({Key? key}) : super(key: key);

  @override
  _ListingState createState() => _ListingState();
}

class _ListingState extends State<Listing> {
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
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Ativos",
                ),
                Tab(text: "Vendidos"),
                Tab(
                  text: "Abatidos",
                ),
                Tab(text: "Morto"),
              ],
              unselectedLabelColor: Colors.black54,
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
            ),
            title: Text(
              "Meus Coelhos",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  color: Colors.black),
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              tab1(),
              tab_vendidos(),
              tab_abatidos(),
              tab_mortos(),
            ],
          ),
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