import 'package:bunny/components/delete_coelho/custom_coelho_button_delete.dart';
import 'package:bunny/controllers/delete_coelho_controller.dart';
import 'package:bunny/controllers/listing_reproductions_controller.dart';
import 'package:bunny/models/listing_reproductions_model.dart';
import 'package:bunny/models/reproduction_model.dart';
import 'package:bunny/repositories/delete_coelho/delete_coelho_repository_imp.dart';
import 'package:bunny/repositories/list_reproductions_repository/listing_reproductions_repository_imp.dart';
import 'package:bunny/services/dio_service_imp.dart';
import 'package:bunny/util/colors.dart';
import 'package:flutter/material.dart';

class reproductions extends StatefulWidget {
  const reproductions({Key? key}) : super(key: key);

  @override
  _reproductionsState createState() => _reproductionsState();
}

class _reproductionsState extends State<reproductions> {
  final ListingReproductionsController _controller =
      ListingReproductionsController(ListingReproductionsImp(DioServiceImp()));

  DeleteCoelhoController _controllerdelete =
      DeleteCoelhoController(DeleteCoelhoRepositoryImp(DioServiceImp()));

  @override
  void initState() {
    super.initState();

    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<listingreproduction>?>(
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
                                child: Text("R",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                            title: Text("Ninhada: " + show[idx].id!.toString()),
                            subtitle: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Cruzado: " + show[idx].dataColocarNinho!),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          '/detailsreproductions',
                                          arguments: show[idx]);
                                    },
                                    icon: Icon(
                                      Icons.show_chart,
                                      color: azulCarregado,
                                    )),
                              ],
                            ),
                          ),
                        )
                      : Text("Não Exeste nenhum dados guardados");
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
