import 'package:bunny/components/delete_coelho/custom_coelho_button_delete.dart';
import 'package:bunny/controllers/delete_coelho_controller.dart';
import 'package:bunny/controllers/listing_controller.dart';
import 'package:bunny/models/listing_model.dart';
import 'package:bunny/repositories/delete_coelho/delete_coelho_repository_imp.dart';
import 'package:bunny/repositories/listing_repository/listing_repository_imp.dart';
import 'package:bunny/services/dio_service_imp.dart';
import 'package:bunny/util/colors.dart';
import 'package:flutter/material.dart';

class tab1 extends StatefulWidget {
  const tab1({Key? key}) : super(key: key);

  @override
  _tab1State createState() => _tab1State();
}

class _tab1State extends State<tab1> {
  final ListingController _controller =
      ListingController(ListingRepositoryImp(DioServiceImp()));
  DeleteCoelhoController _controllerdelete =
      DeleteCoelhoController(DeleteCoelhoRepositoryImp(DioServiceImp()));

  @override
  void initState() {
    super.initState();

    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<listing>?>(
      valueListenable: _controller.show,
      builder: (_, show, __) {
        return show != null
            ? ListView.builder(
                itemCount: show.length,
                itemBuilder: (_, idx) {
                  return idx != null
                      ? Padding(
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
                                child: Text(show[idx].nome!.substring(0, 2),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                            title: Text(show[idx].nome!),
                            subtitle: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Sexo: ${show[idx].sexo} '),
                                Text('| Ninhada: ${show[idx].ninhada} '),
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
                                    icon: Icon(
                                      Icons.edit,
                                      color: azulCarregado,
                                    )),
                                CustomDeleteCoelhoButtonComponents(
                                  altura: 50,
                                  Corbotao: azulCarregado,
                                  largura:
                                      MediaQuery.of(context).size.width - 0,
                                  texto: "Eliminar",
                                  id: show[idx].id.toString(),
                                  deleteController: _controllerdelete,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Text("N??o Exeste nenhum dados guardados");
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
