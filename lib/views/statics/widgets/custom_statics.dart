import 'package:bunny/controllers/statics_controller.dart';
import 'package:bunny/models/estatisticas_model.dart';
import 'package:bunny/repositories/statics_repository/statics_repository_imp.dart';
import 'package:bunny/routes/app_page.dart';
import 'package:bunny/services/dio_service_imp.dart';
import 'package:bunny/views/statics/widgets/custom_cardstatics.dart';
import 'package:flutter/material.dart';

class Custom_Statics extends StatefulWidget {
  const Custom_Statics({Key? key}) : super(key: key);

  @override
  _Custom_StaticsState createState() => _Custom_StaticsState();
}

class _Custom_StaticsState extends State<Custom_Statics> {
  final StaticsController _controller =
      StaticsController(StaticsRepositoryImp(DioServiceImp()));

  @override
  void initState() {
    super.initState();

    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<estatisticas>?>(
      valueListenable: _controller.show,
      builder: (_, show, __) {
        return show != null
            ? ListView.builder(
                itemCount: show.length,
                itemBuilder: (_, idx) {
                  return Column(
                    children: [
                      CardStatics(
                        texto: 'Total de Coelhos',
                        description: '${show[idx].totalCoelhos} ',
                      ),
                      CardStatics(
                        texto: 'Total ativos',
                        description: '${show[idx].totalAtivos} ',
                      ),
                      CardStatics(
                        texto: 'Total Vendidos',
                        description: '${show[idx].totalVendidos} ',
                      ),
                      CardStatics(
                        texto: 'Total Imaturos',
                        description: '${show[idx].totalImaturos} ',
                      ),
                      CardStatics(
                        texto: 'Total abatidos',
                        description: '${show[idx].totalAbatidos} ',
                      ),
                      CardStatics(
                        texto: 'Total mortos',
                        description: '${show[idx].totalMortos} ',
                      ),
                      CardStatics(
                        texto: 'Total a venda',
                        description: '${show[idx].totalAVenda} ',
                      ),
                      CardStatics(
                        texto: 'Total preferidos',
                        description: '${show[idx].totalPreferidos} ',
                      ),
                    ],
                  );
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
